import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/success_screen/success_screen.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/authentication/controllers/signup/varify_email_controller.dart';
import 'package:t_store/features/authentication/screens/login/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class VerifyEmailPage extends StatelessWidget {
  const VerifyEmailPage({super.key, this.email});
  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, actions: [
        IconButton(
            onPressed: () {
              AuthenticationRepository.instance.logout();
            },
            icon: const Icon(CupertinoIcons.clear)),
      ]),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(ISizes.defaultSpace),
        child: Column(children: [
          Image(
            image: const AssetImage(IImages.deliveredEmailIllustration),
            width: IHelperFunctions.screenWidth() * 0.6,
          ),
          const SizedBox(height: ISizes.spaceBtwSections),
          Text(
            ITexts.confirmEmail,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: ISizes.spaceBtwItems),
          Text(email ?? '',
              style: Theme.of(context).textTheme.labelLarge,
              textAlign: TextAlign.center),
          const SizedBox(height: ISizes.spaceBtwItems),
          Text(
            ITexts.confirmEmailSubTitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: ISizes.spaceBtwSections),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                controller.checkIfEmailVerificationStatus();
              },
              child: const Text(ITexts.tContinue),
            ),
          ),
          const SizedBox(height: ISizes.spaceBtwItems),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                controller.sendEmailVerification();
              },
              child: const Text(ITexts.resendEmail),
            ),
          )
        ]),
      )),
    );
  }
}
