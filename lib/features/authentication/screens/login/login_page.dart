import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:t_store/common/styles/spacing_styles.dart';
import 'package:t_store/common/widgets_login_sinup/Form_divider.dart';
import 'package:t_store/common/widgets_login_sinup/social_buttons.dart';
import 'package:t_store/features/authentication/screens/login/widgets/login_form.dart';
import 'package:t_store/features/authentication/screens/login/widgets/login_header.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: ISpacingStyles.paddingWithAppBarHeight,
        child: Column(
          children: [
            const ILoginHeader(),
            const ILoginForm(),
            IFormDivider(dividerText: ITexts.orSignInWith.capitalize!),
            const SizedBox(height: ISizes.spaceBtwItems),
            const ISocialButtons(),
          ],
        ),
      ),
    ));
  }
}
