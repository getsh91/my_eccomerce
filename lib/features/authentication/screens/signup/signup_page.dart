import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:t_store/common/widgets/login_signup/form_divider.dart';
import 'package:t_store/common/widgets/login_signup/social_buttons.dart';
import 'package:t_store/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(ISizes.defaultSpace),
            child: Column(children: [
              Text(ITexts.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: ISizes.spaceBtwSections),
              const SignupForm(),
              const SizedBox(height: ISizes.spaceBtwSections),
              IFormDivider(dividerText: ITexts.orSignUpWith.capitalize!),
              const SizedBox(height: ISizes.spaceBtwSections),
              const ISocialButtons(),
              Text(
                  "By signing up you agree to our Terms of Use and Privacy Policy",
                  style: Theme.of(context).textTheme.bodySmall)
            ]),
          ),
        ));
  }
}
