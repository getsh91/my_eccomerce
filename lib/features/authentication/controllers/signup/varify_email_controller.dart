import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/success_screen/success_screen.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/popups/loader.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  //send email whenever verify screen appears and set timer for auto redirect
  @override
  void onInit() {
    setTimerForAutoReditect();
    sendEmailVerification();
    checkIfEmailVerificationStatus();
    super.onInit();
  }

  //send email verification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      ILoaders.successSnackBar(
          title: 'Email sent',
          message:
              'We have sent you an email. Please check your inbox and verify your email address');
    } catch (e) {
      ILoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  //timer for auto redirect
  setTimerForAutoReditect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(SuccessScreen(
            image: IImages.successfulyRegisterAnimation,
            title: ITexts.yourAccountCreatedTitle,
            subTitle: ITexts.yourAccountCreatedSubTitle,
            onPressed: () =>
                AuthenticationRepository.instance.screenRedirect()));
      }
    });
  }

  //manually check if email verified
  checkIfEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(SuccessScreen(
          image: IImages.successfulyRegisterAnimation,
          title: ITexts.yourAccountCreatedTitle,
          subTitle: ITexts.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect()));
    }
  }
}
