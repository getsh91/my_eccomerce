import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/personalization/models/user_model.dart';
import 'package:t_store/utils/popups/loader.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

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
