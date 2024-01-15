import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';

class IShadowStyle {
  static final verticalProductShadow = BoxShadow(
    color: IColors.darkGrey.withOpacity(0.1),
    spreadRadius: 7,
    blurRadius: 50,
    offset: Offset(0, 2),
  );
  static final horizontalProductShadow = BoxShadow(
    color: IColors.darkGrey.withOpacity(0.1),
    spreadRadius: 7,
    blurRadius: 50,
    offset: Offset(2, 0),
  );
}
