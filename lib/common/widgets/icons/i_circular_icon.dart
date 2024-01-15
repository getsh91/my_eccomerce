import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class ICircularIcon extends StatelessWidget {
  const ICircularIcon(
      {super.key,
      this.width,
      this.height,
      this.size = ISizes.lg,
      required this.icon,
      this.color,
      this.backgroundColor,
      this.onPressed});

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = IHelperFunctions.isDarkMode(context);
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor != null
              ? backgroundColor!
              : dark
                  ? IColors.black.withOpacity(0.9)
                  : IColors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(100),
        ),
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(icon, color: color, size: size),
        ));
  }
}
