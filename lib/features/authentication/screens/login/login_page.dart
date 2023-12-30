import 'package:flutter/material.dart';
import 'package:t_store/common/styles/spacing_styles.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = IHelperFunctions.isDarkMode(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: ISpacingStyles.paddingWithAppBarHeight,
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                    height: 150,
                    image: AssetImage(
                        dark ? IImages.lightAppLogo : IImages.darkAppLogo)),
                Text(ITexts.loginTitle,
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: ISizes.sm),
                Text(ITexts.loginSubTitle,
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
            Form(
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
                const SizedBox(height: ISizes.spaceBtwInputFields / 2)
              ],
            ))
          ],
        ),
      ),
    ));
  }
}
