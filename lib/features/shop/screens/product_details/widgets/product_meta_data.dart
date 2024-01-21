import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/images/i_circular_image.dart';
import 'package:t_store/common/widgets/texts/i_brand_title_with_verified_icon.dart';
import 'package:t_store/common/widgets/texts/product_title_text.dart';
import 'package:t_store/common/widgets/texts/produt_price_text.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class IProductMetaData extends StatelessWidget {
  const IProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = IHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            IRoundedContainer(
              radius: ISizes.sm,
              padding: const EdgeInsets.symmetric(
                  horizontal: ISizes.sm, vertical: ISizes.xs),
              backgroundColor: IColors.secondary.withOpacity(0.8),
              child: Text('25%',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: IColors.black)),
            ),
            const SizedBox(width: ISizes.spaceBtwItems),
            Text('\$300',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: ISizes.spaceBtwItems),
            const IProductPriceText(price: '150', isLarge: true),
          ],
        ),
        const SizedBox(height: ISizes.spaceBtwItems / 1.5),
        const IProductTitleText(title: 'Green Nike Sports Shirt'),
        const SizedBox(height: ISizes.spaceBtwItems / 1.5),
        Row(
          children: [
            const IProductTitleText(title: 'Status'),
            const SizedBox(width: ISizes.spaceBtwItems),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: ISizes.spaceBtwItems / 1.5),
        Row(
          children: [
            ICircularImage(
                image: IImages.nikeLogo,
                width: 32,
                height: 32,
                overlayColor: dark ? IColors.white : IColors.black),
            const IBrandTitleWithVerifiedIcon(
              title: 'Nike',
              brandTextSize: TextSizes.small,
            )
          ],
        )
      ],
    );
  }
}
