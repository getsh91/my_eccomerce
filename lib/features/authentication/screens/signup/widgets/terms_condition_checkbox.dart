import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TermsAndConditionCheckbox extends StatelessWidget {
  const TermsAndConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = IHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            onChanged: (value) {},
            value: true,
          ),
        ),
        const SizedBox(width: ISizes.spaceBtwItems),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: '${ITexts.iAgreeTo}',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: '${ITexts.privacyPolicy}',
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? IColors.white : IColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? IColors.white : IColors.primary,
                  )),
          TextSpan(
              text: '${ITexts.and}',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: '${ITexts.termsOfUse}',
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? IColors.white : IColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? IColors.white : IColors.primary,
                  ))
        ]))
      ],
    );
  }
}
