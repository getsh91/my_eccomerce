import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/success_screen/success_screen.dart';
import 'package:t_store/features/authentication/screens/login/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class VerifyEmailPage extends StatelessWidget {
  const VerifyEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {
              Get.offAll(const LoginPage());
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
          Text('support@isu.com',
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
                Get.offAll(SuccessScreen(
                  image: IImages.staticSuccessIllustration,
                  title: ITexts.yourAccountCreatedTitle,
                  subTitle: ITexts.yourAccountCreatedSubTitle,
                  onPressed: () => Get.offAll(const LoginPage()),
                ));
              },
              child: const Text(ITexts.tContinue),
            ),
          ),
          const SizedBox(height: ISizes.spaceBtwItems),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {},
              child: const Text(ITexts.resendEmail),
            ),
          )
        ]),
      )),
    );
  }
}
