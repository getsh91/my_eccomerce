import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class ICurcularImage extends StatelessWidget {
  const ICurcularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.padding = ISizes.sm,
    required this.image,
    this.backgroundColor,
    this.overlayColor,
    this.fit = BoxFit.cover,
    this.isNetwokImage = false,
  });

  final double? width, height, padding;
  final String image;
  final Color? backgroundColor;
  final Color? overlayColor;
  final BoxFit? fit;
  final bool isNetwokImage;

  @override
  Widget build(BuildContext context) {
    final dark = IHelperFunctions.isDarkMode(context);
    return Container(
      width: 56,
      height: 56,
      padding: const EdgeInsets.all(ISizes.sm),
      decoration: BoxDecoration(
        color: dark ? IColors.black : IColors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Image(
        image: const AssetImage(IImages.clothIcon),
        color: dark ? IColors.white : IColors.black,
      ),
    );
  }
}