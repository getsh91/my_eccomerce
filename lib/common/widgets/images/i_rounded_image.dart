import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class IRoundedImage extends StatelessWidget {
  const IRoundedImage({
    super.key,
    this.width = 300,
    this.height = 158,
    required this.imageUrl,
    this.applyImageRadius = false,
    this.border,
    this.backgroundColor = IColors.light,
    this.fit = BoxFit.contain,
    this.padding,
    this.isNetwokImage = false,
    this.onPressed,
    this.borderRadius = ISizes.md,
  });
  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetwokImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(ISizes.md)),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: width,
          height: height,
          padding: padding,
          decoration: BoxDecoration(
              border: border,
              color: backgroundColor,
              borderRadius: BorderRadius.circular(borderRadius)),
          child: ClipRRect(
              borderRadius: applyImageRadius
                  ? BorderRadius.circular(borderRadius)
                  : BorderRadius.zero,
              child: Image(
                fit: fit,
                image: isNetwokImage
                    ? NetworkImage(imageUrl)
                    : AssetImage(imageUrl) as ImageProvider,
              )),
        ),
      ),
    );
  }
}
