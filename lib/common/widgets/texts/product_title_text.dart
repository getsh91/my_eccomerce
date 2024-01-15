import 'package:flutter/material.dart';

class IProductTitleText extends StatelessWidget {
  const IProductTitleText(
      {super.key,
      required this.title,
      this.maxLines = 2,
      this.textAlign = TextAlign.left,
      this.smallSize = false});
  final String title;
  final int maxLines;
  final TextAlign? textAlign;
  final bool smallSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      style: smallSize
          ? Theme.of(context).textTheme.labelLarge
          : Theme.of(context).textTheme.titleSmall,
    );
  }
}
