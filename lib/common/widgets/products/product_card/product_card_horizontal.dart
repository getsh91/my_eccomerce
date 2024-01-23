import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/styles/shadows.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/icons/i_circular_icon.dart';
import 'package:t_store/common/widgets/images/i_rounded_image.dart';
import 'package:t_store/common/widgets/texts/i_brand_title_with_verified_icon.dart';
import 'package:t_store/common/widgets/texts/product_title_text.dart';
import 'package:t_store/common/widgets/texts/produt_price_text.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class IProductCardHorizontal extends StatelessWidget {
  const IProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = IHelperFunctions.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ISizes.productImageRadius),
          color: dark ? IColors.darkerGrey : IColors.softGrey,
          boxShadow: [IShadowStyle.verticalProductShadow]),
      child: Row(
        children: [
          IRoundedContainer(
              height: 120,
              padding: const EdgeInsets.all(ISizes.sm),
              backgroundColor: dark ? IColors.dark : IColors.light,
              child: Stack(
                children: [
                  const SizedBox(
                      width: 120,
                      height: 120,
                      child: IRoundedImage(
                        imageUrl: IImages.productImage1,
                        applyImageRadius: true,
                      )),
                  Positioned(
                    top: 12,
                    child: IRoundedContainer(
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
                  ),
                  Positioned(
                      top: 0,
                      right: 0,
                      child: ICircularIcon(
                        icon: Iconsax.heart5,
                        onPressed: () {},
                        color: Colors.red,
                      )),
                ],
              )),
          SizedBox(
            width: 172,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: ISizes.sm, left: ISizes.sm),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IProductTitleText(
                            title: 'Green Nike Half Sleeves Shirt',
                            smallSize: true),
                        SizedBox(height: ISizes.spaceBtwItems / 2),
                        IBrandTitleWithVerifiedIcon(title: 'Nike'),
                      ]),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Flexible(child: IProductPriceText(price: '250.0')),
                    Container(
                      decoration: const BoxDecoration(
                          color: IColors.dark,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(ISizes.cardRadiusMd),
                              bottomRight:
                                  Radius.circular(ISizes.productImageRadius))),
                      child: const SizedBox(
                          width: ISizes.iconLg * 1.2,
                          height: ISizes.iconLg * 1.2,
                          child: Center(
                            child: Icon(
                              Iconsax.add,
                              color: IColors.white,
                            ),
                          )),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
