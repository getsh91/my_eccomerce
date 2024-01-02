import 'package:flutter/material.dart';
import 'package:t_store/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:t_store/features/authentication/screens/signup/signup_page.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

class ILoginForm extends StatelessWidget {
  const ILoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding: const EdgeInsets.only(top: ISizes.spaceBtwSections),
      child: Column(
        children: [
          TextFormField(
              decoration: const InputDecoration(
            prefixIcon: Icon(Iconsax.direct_right),
            hintText: ITexts.email,
          )),
          const SizedBox(height: ISizes.spaceBtwInputFields),
          TextFormField(
              decoration: const InputDecoration(
            prefixIcon: Icon(Iconsax.password_check),
            hintText: ITexts.password,
            suffixIcon: Icon(Iconsax.eye_slash),
          )),
          const SizedBox(height: ISizes.spaceBtwInputFields / 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(value: true, onChanged: (value) {}),
                  const Text(ITexts.rememberMe),
                ],
              ),
              TextButton(
                  onPressed: () {
                    Get.to(() => const ForgetPassword());
                  },
                  child: const Text(ITexts.forgetPassword)),
            ],
          ),
          const SizedBox(height: ISizes.spaceBtwSections),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {}, child: const Text(ITexts.signIn)),
          ),
          const SizedBox(height: ISizes.spaceBtwItems),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
                onPressed: () {
                  Get.to(() => const SignupPage());
                },
                child: const Text(ITexts.createAccount)),
          ),
          const SizedBox(height: ISizes.spaceBtwSections),
        ],
      ),
    ));
  }
}
