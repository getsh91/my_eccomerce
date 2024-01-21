import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/styles/shadows.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/icons/i_circular_icon.dart';
import 'package:t_store/common/widgets/images/i_rounded_image.dart';
import 'package:t_store/common/widgets/texts/i_brand_title_with_verified_icon.dart';
import 'package:t_store/common/widgets/texts/product_title_text.dart';
import 'package:t_store/common/widgets/texts/produt_price_text.dart';
import 'package:t_store/features/shop/screens/product_details/product_details.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class IProductCardVertical extends StatelessWidget {
  const IProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = IHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        Get.to(const ProductDetails());
      },
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [IShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(ISizes.productImageRadius),
          color: dark ? IColors.darkerGrey : IColors.white,
        ),
        child: Column(children: [
          IRoundedContainer(
            height: 180,
            padding: const EdgeInsets.all(ISizes.sm),
            backgroundColor: dark ? IColors.dark : IColors.light,
            child: Stack(
              children: [
                const IRoundedImage(
                  imageUrl: IImages.productImage1,
                  applyImageRadius: true,
                ),
                Positioned(
                  top: 10,
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
            ),
          ),
          const SizedBox(height: ISizes.spaceBtwItems / 2),
          const Padding(
            padding: EdgeInsets.only(left: ISizes.sm),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              IProductTitleText(
                title: 'Green Nike Air Shoes',
                smallSize: true,
              ),
              SizedBox(height: ISizes.spaceBtwItems / 2),
              IBrandTitleWithVerifiedIcon(title: 'Nike'),
            ]),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: ISizes.sm),
                child: IProductPriceText(
                  price: '35',
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    color: IColors.dark,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(ISizes.cardRadiusMd),
                        bottomRight:
                            Radius.circular(ISizes.productImageRadius))),
                child: const SizedBox(
                    height: ISizes.iconLg * 1.2,
                    width: ISizes.iconLg * 1.2,
                    child: Center(
                      child: Icon(
                        Iconsax.add,
                        color: IColors.white,
                      ),
                    )),
              )
            ],
          )
        ]),
      ),
    );
  }
}
