import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/shop/screens/card/cart.dart';
import 'package:t_store/utils/constants/colors.dart';

class ICartCounterIcon extends StatelessWidget {
  const ICartCounterIcon({
    super.key,
    this.iconColor,
    required this.onPressed,
  });
  final Color? iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            onPressed: () {
              Get.to(const CartScreen());
            },
            icon: Icon(Iconsax.shopping_bag, color: iconColor)),
        Positioned(
            right: 0,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                  color: IColors.black,
                  borderRadius: BorderRadius.circular(100)),
              child: Center(
                  child: Text(
                '3',
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
