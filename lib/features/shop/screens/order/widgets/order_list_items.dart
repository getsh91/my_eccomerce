import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class IOrderListItems extends StatelessWidget {
  const IOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = IHelperFunctions.isDarkMode(context);
    return ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) =>
            const SizedBox(height: ISizes.spaceBtwItems),
        itemBuilder: (_, index) => IRoundedContainer(
              showBorder: true,
              padding: const EdgeInsets.all(ISizes.sm),
              backgroundColor: dark ? IColors.dark : IColors.light,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      const Icon(Iconsax.ship),
                      const SizedBox(width: ISizes.spaceBtwItems / 2),
                      Expanded(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Processing',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .apply(
                                      color: IColors.primary,
                                      fontWeightDelta: 1)),
                          Text('07 Nov, 2024',
                              style: Theme.of(context).textTheme.headlineSmall)
                        ],
                      )),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Iconsax.arrow_right_34,
                            size: ISizes.iconSm,
                          ))
                    ],
                  ),
                  const SizedBox(height: ISizes.spaceBtwItems),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            const Icon(Iconsax.tag),
                            const SizedBox(width: ISizes.spaceBtwItems / 2),
                            Expanded(
                                child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Order',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium),
                                Text('[#23s54]',
                                    style:
                                        Theme.of(context).textTheme.titleMedium)
                              ],
                            )),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            const Icon(Iconsax.calendar),
                            const SizedBox(width: ISizes.spaceBtwItems / 2),
                            Expanded(
                                child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Shipping Date',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium),
                                Text('07 Feb, 2024',
                                    style:
                                        Theme.of(context).textTheme.titleMedium)
                              ],
                            )),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ));
  }
}
