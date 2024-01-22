import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/chip/choice_chip.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/texts/product_title_text.dart';
import 'package:t_store/common/widgets/texts/produt_price_text.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class IProductAttributes extends StatelessWidget {
  const IProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = IHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        IRoundedContainer(
          padding: const EdgeInsets.all(ISizes.md),
          backgroundColor: dark ? IColors.darkerGrey : IColors.grey,
          child: Column(
            children: [
              Row(
                children: [
                  const ISectionHeading(
                      showActionButton: false, title: 'Variation'),
                  const SizedBox(width: ISizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const IProductTitleText(
                              title: 'Price', smallSize: true),
                          const SizedBox(width: ISizes.spaceBtwItems),
                          Text(
                            '\$25',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(width: ISizes.spaceBtwItems),
                          const IProductPriceText(price: '30')
                        ],
                      ),
                      Row(children: [
                        const IProductTitleText(
                            title: 'Stock: ', smallSize: true),
                        Text('In Stock',
                            style: Theme.of(context).textTheme.titleMedium)
                      ]),
                    ],
                  ),
                ],
              ),
              const IProductTitleText(
                title:
                    'The shoe typically features perforations on the toe box and sidewalls, promoting ',
                smallSize: true,
                maxLines: 4,
              )
            ],
          ),
        ),
        const SizedBox(height: ISizes.spaceBtwItems),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ISectionHeading(showActionButton: true, title: 'Colors'),
            const SizedBox(height: ISizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                IChoiceChip(
                    text: 'Green', isSelected: true, onSelected: (value) {}),
                IChoiceChip(
                    text: 'Blue', isSelected: false, onSelected: (value) {}),
                IChoiceChip(
                    text: 'Red', isSelected: false, onSelected: (value) {}),
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ISectionHeading(showActionButton: false, title: 'Size'),
            const SizedBox(height: ISizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                IChoiceChip(
                    text: 'EU 34', isSelected: true, onSelected: (value) {}),
                IChoiceChip(
                    text: 'EU 36', isSelected: false, onSelected: (value) {}),
                IChoiceChip(
                    text: 'EU 38', isSelected: true, onSelected: (value) {}),
                IChoiceChip(
                    text: 'EU 38', isSelected: true, onSelected: (value) {}),
              ],
            )
          ],
        )
      ],
    );
  }
}
