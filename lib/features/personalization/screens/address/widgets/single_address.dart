import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class ISingleAddress extends StatelessWidget {
  const ISingleAddress({super.key, required this.selectAddress});
  final bool selectAddress;

  @override
  Widget build(BuildContext context) {
    final dark = IHelperFunctions.isDarkMode(context);
    return IRoundedContainer(
      padding: const EdgeInsets.all(ISizes.sm),
      width: double.infinity,
      showBorder: true,
      backgroundColor:
          selectAddress ? IColors.primary.withOpacity(0.5) : Colors.transparent,
      borderColor: selectAddress
          ? Colors.transparent
          : dark
              ? IColors.darkGrey
              : IColors.grey,
      margin: const EdgeInsets.only(bottom: ISizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(selectAddress ? Iconsax.tick_circle : null,
                color: selectAddress
                    ? dark
                        ? IColors.light
                        : IColors.dark
                    : null),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('John Doe',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: ISizes.sm / 2),
              const Text('(+251) 912 345 678',
                  maxLines: 1, overflow: TextOverflow.ellipsis),
              const SizedBox(height: ISizes.sm / 2),
              const Text('Addis Ababa, Ethiopia', softWrap: true)
            ],
          )
        ],
      ),
    );
  }
}
