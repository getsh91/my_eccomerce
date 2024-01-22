import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/images/i_rounded_image.dart';
import 'package:t_store/common/widgets/texts/i_brand_title_with_verified_icon.dart';
import 'package:t_store/common/widgets/texts/product_title_text.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class ICartItem extends StatelessWidget {
  const ICartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = IHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        IRoundedImage(
            imageUrl: IImages.productImage1,
            width: 60,
            height: 60,
            padding: const EdgeInsets.all(ISizes.sm),
            backgroundColor: dark ? IColors.darkerGrey : IColors.light),
        const SizedBox(width: ISizes.spaceBtwItems),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const IBrandTitleWithVerifiedIcon(title: 'Nike'),
              const Flexible(
                child: IProductTitleText(
                  title: 'Black Sport Shoes',
                  maxLines: 1,
                ),
              ),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'Color: ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: 'Green',
                    style: Theme.of(context).textTheme.bodyLarge),
                TextSpan(
                    text: 'Size: ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: 'EU40 ',
                    style: Theme.of(context).textTheme.bodyLarge),
              ]))
            ],
          ),
        )
      ],
    );
  }
}
