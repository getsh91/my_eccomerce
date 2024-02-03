import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/authentication/screens/login/login_page.dart';
import 'package:t_store/features/personalization/models/user_model.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loader.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());
  final profileLoading = false.obs;
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final hidePassword = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  //fetch user data
  Future<void> fetchUserData() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserData();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        //convert name to first and last name
        final nameParts =
            UserModel.nameParts(userCredentials.user!.displayName ?? '');
        final username =
            UserModel.generateUsername(userCredentials.user!.displayName ?? '');

        //map data
        final user = UserModel(
          id: userCredentials.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join('') : '',
          email: userCredentials.user!.email ?? '',
          phoneNumber: userCredentials.user!.phoneNumber ?? '',
          userName: username,
          profilePicture: userCredentials.user!.photoURL ?? '',
        );
        //save user data
        await UserRepository().saveUserRecord(user);
      }
    } catch (e) {
      ILoaders.warningSnackBar(
          title: 'Data not saved',
          message:
              'Something went wrong while saving your information.you can re-save your data in your profile.');
    }
  }

  //delete accont warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(ISizes.defaultSpace),
        title: 'Delete Account',
        middleText: 'Are you sure you want to delete your account permanently?',
        confirm: ElevatedButton(
            onPressed: () async => deleteUserAccount(),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: ISizes.lg),
              child: Text('Delete'),
            )),
        cancel: OutlinedButton(
          onPressed: () => Navigator.of(Get.overlayContext!).pop(),
          child: const Text('Cancel'),
        ));
  }

  //delete user account
  void deleteUserAccount() async {
    try {
      //start loading
      IFullScreenLoader.openLoadingDialog(
          'Processong..', IImages.decorAnimation);
      //first re-authenticate user
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        //re varify auth email
        if (provider == 'google.com') {
          await auth.signinWithGoogle();
          await auth.deleteAccount();
          IFullScreenLoader.stopLoading();
          Get.offAll(const LoginPage());
        } else if (provider == 'password') {
          IFullScreenLoader.stopLoading();
          Get.to(const ReAuthLoginForm());
        }
      }
    } catch (e) {
      IFullScreenLoader.stopLoading();
      ILoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  //re-authenticate before deleting account
  Future<void> reAuthenticateEmailAndPaswordUser() async {
    try {
      //start loading
      IFullScreenLoader.openLoadingDialog(
          'Processong..', IImages.decorAnimation);
      //check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        IFullScreenLoader.stopLoading();
        return;
      }
      //form validation
      if (!reAuthFormKey.currentState!.validate()) {
        IFullScreenLoader.stopLoading();
        return;
      }
      //re-authenticate user
      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());
      //delete user account
      await AuthenticationRepository.instance.deleteAccount();
      //remove loader
      IFullScreenLoader.stopLoading();
      //redirect
      Get.offAll(const LoginPage());
    } catch (e) {
      //remove loading
      IFullScreenLoader.stopLoading();
      //show error
      ILoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}
