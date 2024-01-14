import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/device/device_utility.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class ISearchContainer extends StatelessWidget {
  const ISearchContainer({
    super.key,
    required this.text,
    this.icon,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
  });
  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = IHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: ISizes.defaultSpace),
        child: Container(
          padding: const EdgeInsets.all(ISizes.md),
          width: IDeviceUtils.getScreenWidth(context),
          decoration: BoxDecoration(
            color: showBackground
                ? dark
                    ? IColors.dark
                    : IColors.light
                : Colors.transparent,
            borderRadius: BorderRadius.circular(ISizes.cardRadiusLg),
            border: showBorder ? Border.all(color: IColors.grey) : null,
          ),
          child: Row(children: [
            Icon(icon, color: IColors.darkerGrey),
            const SizedBox(width: ISizes.spaceBtwItems),
            Text(text, style: Theme.of(context).textTheme.bodySmall)
          ]),
        ),
      ),
    );
  }
}
