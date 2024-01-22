import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/brand/brand_show_case.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ICategoryTab extends StatelessWidget {
  const ICategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(ISizes.defaultSpace),
            child: Column(
              children: [
                const IBrandShowcase(
                  images: [
                    IImages.productImage1,
                    IImages.productImage2,
                    IImages.productImage3,
                  ],
                ),
                const SizedBox(height: ISizes.spaceBtwItems),
                ISectionHeading(
                  title: "you might like",
                  onPressed: () {},
                  showActionButton: true,
                ),
                const SizedBox(height: ISizes.spaceBtwItems),
                IGridLayout(
                    itemCount: 4,
                    itemBuilder: (_, index) => const IProductCardVertical()),
                const SizedBox(height: ISizes.spaceBtwSections),
              ],
            ),
          ),
        ]);
  }
}
