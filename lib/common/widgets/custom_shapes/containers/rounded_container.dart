import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class IRoundedContainer extends StatelessWidget {
  const IRoundedContainer({
    super.key,
    this.child,
    this.width,
    this.height,
    this.margin,
    this.radius = ISizes.cardRadiusLg,
    this.padding,
    this.backgroundColor = IColors.white,
    this.showBorder = false,
    this.borderColor = IColors.borderPrimary,
  });
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final bool showBorder;
  final Widget? child;
  final Color backgroundColor;
  final Color borderColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius),
          border: showBorder ? Border.all(color: borderColor) : null),
      child: child,
    );
  }
}
