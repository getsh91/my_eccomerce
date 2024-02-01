import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loader.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

//send reset password email
  sendPasswordResetEmail() async {
    try {
      //start loading
      IFullScreenLoader.openLoadingDialog(
          'Prosseng your request..', IImages.decorAnimation);
      //check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        IFullScreenLoader.stopLoading();
        return;
      }
      //form validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        IFullScreenLoader.stopLoading();
        return;
      }
      //send email to reset password
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());
      //remove loader
      IFullScreenLoader.stopLoading();

      //show success message
      ILoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email link sent to reset your password'.tr);
      //move to varification screen
      Get.to(ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      IFullScreenLoader.stopLoading();
      ILoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      //start loading
      IFullScreenLoader.openLoadingDialog(
          'Prosseng your request..', IImages.decorAnimation);
      //check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        IFullScreenLoader.stopLoading();
        return;
      }
      //send email to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);
      //remove loader
      IFullScreenLoader.stopLoading();

      //show success message
      ILoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email link sent to reset your password'.tr);
    } catch (e) {
      IFullScreenLoader.stopLoading();
      ILoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}
