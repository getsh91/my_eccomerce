import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loader.dart';

class LoginController extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();
  final hidePassword = true.obs;
  final rememberMe = false.obs;
  final localStorage = GetStorage();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    localStorage.write('REMEMBER_ME_EMAIL', '');
    localStorage.write('REMEMBER_ME_PASSWORD', '');
    super.onInit();
  }

  Future<void> emailAndPasswordLogin() async {
    try {
      //start loading
      IFullScreenLoader.openLoadingDialog(
          'Logging you in..', IImages.decorAnimation);
      //check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        IFullScreenLoader.stopLoading();
        return;
      }
      //form validation
      if (!loginFormKey.currentState!.validate()) {
        IFullScreenLoader.stopLoading();
        return;
      }
      //save data if remember me is checked
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }
      //login user using email and password
      final userCredential = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());
      //remove loading
      IFullScreenLoader.stopLoading();
      //redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      //remove loading
      IFullScreenLoader.stopLoading();
      //show error
      ILoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}
