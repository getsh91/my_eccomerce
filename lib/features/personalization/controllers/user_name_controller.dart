import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/features/personalization/screens/profile/profile.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loader.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = Get.put(UserController());
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  //fetch user data
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      //start loading
      IFullScreenLoader.openLoadingDialog(
          'We are updating your information..', IImages.decorAnimation);
      //check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        IFullScreenLoader.stopLoading();
        return;
      }
      //form validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        IFullScreenLoader.stopLoading();
        return;
      }
      //update user first and last name
      Map<String, dynamic> name = {
        'firstName': firstName.text.trim(),
        'lastName': lastName.text.trim()
      };
      await userRepository.updateSingleField(name);

      //update the Rx user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      //remove loading
      IFullScreenLoader.stopLoading();
      //show success message
      ILoaders.successSnackBar(
          title: 'Congratulation', message: 'Your name has been updated');
      //move to previous screen
      Get.off(const ProfileScreen());
    } catch (e) {
      //remove loading
      IFullScreenLoader.stopLoading();
      //show error
      ILoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}
