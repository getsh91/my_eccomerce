import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/personalization/models/user_model.dart';
import 'package:t_store/utils/popups/loader.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  //fetch user data
  Future<void> fetchUserData() async {
    try {
      final user = await userRepository.fetchUserData();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
      ILoaders.warningSnackBar(
          title: 'Data not found',
          message:
              'Something went wrong while fetching your information.you can re-save your data in your profile.');
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
}
