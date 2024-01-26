import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/authentication/screens/signup/widgets/verfiy_email.dart';
import 'package:t_store/features/personalization/models/user_model.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loader.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //variables
  final email = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final phoneNumber = TextEditingController();
  final userName = TextEditingController();
  final hidePassword = true.obs;
  final hidePrivacyPolicyCheck = true.obs;
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  //signup function
  void signUp() async {
    try {
      //start loading
      IFullScreenLoader.openLoadingDialog(
          'We are processing your information..', IImages.decorAnimation);
      //check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        IFullScreenLoader.stopLoading();
        return;
      }
      //form validation
      if (!signupFormKey.currentState!.validate()) {
        IFullScreenLoader.stopLoading();
        return;
      }
      //privacy policy check
      if (!hidePrivacyPolicyCheck.value) {
        ILoaders.warningSnackBar(
            title: 'Please accept privacy policy',
            message:
                'In order to create account, you must have to read and accept our privacy policy');
        return;
      }
      //register user in firbase authentication
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());
      //save user data in firestore
      final newUser = UserModel(
          id: userCredential.user!.uid,
          email: email.text.trim(),
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          userName: userName.text.trim(),
          profilePicture: '  ');

      final userRepository = Get.put(UserRepository());
      userRepository.saveUserRecord(newUser);
      //remove loader
      IFullScreenLoader.stopLoading();

      //show success message
      ILoaders.successSnackBar(
          title: 'Congratulation',
          message: 'Your acount has been created!Verify email to continue.');
      //move to varification screen
      Get.to(VerifyEmailPage(
        email: email.text.trim(),
      ));
    } catch (e) {
      IFullScreenLoader.stopLoading();
      //error handling
      ILoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}
