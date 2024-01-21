import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/corved_edges/corved_edge_widget.dart';
import 'package:t_store/common/widgets/icons/i_circular_icon.dart';
import 'package:t_store/common/widgets/images/i_rounded_image.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class ProductDetailImageSlider extends StatelessWidget {
  const ProductDetailImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = IHelperFunctions.isDarkMode(context);
    return ICurvedEdgeWidget(
      child: Container(
        color: dark ? IColors.darkerGrey : IColors.light,
        child: Stack(
          children: [
            const SizedBox(
                height: 400,
                child: Padding(
                  padding: EdgeInsets.all(ISizes.productImageRadius * 2),
                  child: Center(
                    child: Image(image: AssetImage(IImages.productImage5)),
                  ),
                )),
            Positioned(
                right: 0,
                bottom: 30,
                left: ISizes.defaultSpace,
                child: SizedBox(
                  height: 80,
                  child: ListView.separated(
                    itemCount: 6,
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (_, __) =>
                        const SizedBox(width: ISizes.spaceBtwItems),
                    itemBuilder: (_, index) => IRoundedImage(
                      imageUrl: IImages.productImage3,
                      width: 80,
                      backgroundColor: dark ? IColors.dark : IColors.white,
                      padding: const EdgeInsets.all(ISizes.sm),
                      border: Border.all(color: IColors.primary),
                    ),
                  ),
                )),
            const IAppBar(
              showBackArrow: true,
              actions: [
                ICircularIcon(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
