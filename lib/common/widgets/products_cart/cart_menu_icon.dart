import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/constants/colors.dart';

class ICartCounterIcon extends StatelessWidget {
  const ICartCounterIcon({
    super.key,
    required this.iconColor,
    required this.onPressed,
  });
  final Color iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            onPressed: onPressed,
            icon: Icon(Iconsax.shopping_bag, color: iconColor)),
        Positioned(
            right: 0,
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                  color: IColors.black,
                  borderRadius: BorderRadius.circular(100)),
              child: Center(
                  child: Text(
                '2',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: IColors.white, fontSizeFactor: 0.8),
              )),
            ))
      ],
    );
  }
}
