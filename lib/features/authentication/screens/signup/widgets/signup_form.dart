import 'package:flutter/material.dart';
import 'package:t_store/features/authentication/screens/signup/widgets/terms_condition_checkbox.dart';
import 'package:t_store/features/authentication/screens/signup/widgets/verfiy_email.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        Row(
          children: [
            Expanded(
                child: TextFormField(
              expands: false,
              decoration: const InputDecoration(
                  labelText: ITexts.firstName, prefixIcon: Icon(Iconsax.user)),
            )),
            const SizedBox(width: ISizes.spaceBtwInputFields),
            Expanded(
                child: TextFormField(
              expands: false,
              decoration: const InputDecoration(
                  labelText: ITexts.lastName, prefixIcon: Icon(Iconsax.user)),
            ))
          ],
        ),
        const SizedBox(height: ISizes.spaceBtwInputFields),
        TextFormField(
          decoration: const InputDecoration(
              labelText: ITexts.username, prefixIcon: Icon(Iconsax.user_edit)),
        ),
        const SizedBox(height: ISizes.spaceBtwInputFields),
        TextFormField(
          decoration: const InputDecoration(
              labelText: ITexts.email, prefixIcon: Icon(Iconsax.direct)),
        ),
        const SizedBox(height: ISizes.spaceBtwInputFields),
        TextFormField(
          decoration: const InputDecoration(
              labelText: ITexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
        ),
        const SizedBox(height: ISizes.spaceBtwInputFields),
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
              labelText: ITexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash)),
        ),
        const SizedBox(height: ISizes.spaceBtwInputFields),
        const TermsAndConditionCheckbox(),
        const SizedBox(height: ISizes.spaceBtwSections),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Get.offAll(const VerifyEmailPage());
            },
            child: const Text(ITexts.createAccount),
          ),
        ),
      ],
    ));
  }
}
