import 'package:flutter/material.dart';

class ISelectionHeading extends StatelessWidget {
  const ISelectionHeading({
    super.key,
    this.textColor,
    required this.showActionButton,
    required this.title,
    this.buttonTitle = 'view all',
    this.onPressed,
  });
  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: textColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis),
        if (showActionButton)
          TextButton(onPressed: onPressed, child: Text(buttonTitle))
      ],
    );
  }
}