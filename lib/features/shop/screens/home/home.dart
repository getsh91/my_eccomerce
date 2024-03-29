import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/screens/all_products/all_products.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_catagories.dart';
import 'package:t_store/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/seach_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          IPrimaryHeaderContainer(
            child: Column(
              children: [
                const IHomeAppBar(),
                const SizedBox(height: ISizes.spaceBtwSections),
                ISearchContainer(
                    onTap: () {},
                    icon: Iconsax.search_normal,
                    text: 'Search for products'),
                const SizedBox(height: ISizes.spaceBtwSections),
                Padding(
                  padding: const EdgeInsets.only(left: ISizes.defaultSpace),
                  child: Column(
                    children: [
                      ISectionHeading(
                          title: 'Popular Categories',
                          showActionButton: true,
                          onPressed: () {
                            Get.to(const AllProductsScreen());
                          },
                          textColor: IColors.white),
                      const SizedBox(height: ISizes.spaceBtwItems),
                      const IHomeCatagories(),
                      const SizedBox(height: ISizes.spaceBtwSections),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(ISizes.defaultSpace),
            child: Column(
              children: [
                const IPromoSlider(banners: [
                  IImages.promoBanner1,
                  IImages.promoBanner2,
                  IImages.promoBanner3
                ]),
                const SizedBox(height: ISizes.spaceBtwSections),
                IGridLayout(
                  itemCount: 4,
                  itemBuilder: (_, index) => const IProductCardVertical(),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
