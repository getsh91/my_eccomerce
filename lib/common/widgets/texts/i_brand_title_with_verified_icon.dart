import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/texts/i_brand_title_text.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/sizes.dart';

class IBrandTitleWithVerifiedIcon extends StatelessWidget {
  const IBrandTitleWithVerifiedIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iocnColor = IColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iocnColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
            child: IBrandTitleText(
                title: title,
                maxLines: maxLines,
                textAlign: textAlign,
                brandTextSize: brandTextSize,
                color: textColor)),
        const SizedBox(width: ISizes.xs),
        const Icon(Iconsax.verify5, size: ISizes.iconXs, color: IColors.primary)
      ],
    );
  }
}
