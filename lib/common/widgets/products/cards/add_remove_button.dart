import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/icons/i_circular_icon.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class IProductQuantityWithAddRemove extends StatelessWidget {
  const IProductQuantityWithAddRemove({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = IHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ICircularIcon(
            icon: Iconsax.minus,
            width: 32,
            height: 32,
            size: ISizes.sm,
            color: dark ? IColors.white : IColors.black,
            backgroundColor: dark ? IColors.darkerGrey : IColors.light),
        const SizedBox(width: ISizes.spaceBtwItems),
        Text('1', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: ISizes.spaceBtwItems),
        const ICircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: ISizes.sm,
          color: IColors.white,
          backgroundColor: IColors.primary,
        )
      ],
    );
  }
}
