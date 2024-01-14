import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
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
                const Padding(
                  padding: EdgeInsets.only(left: ISizes.defaultSpace),
                  child: Column(
                    children: [
                      ISelectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: IColors.white),
                      SizedBox(height: ISizes.spaceBtwItems),
                      IHomeCatagories()
                    ],
                  ),
                )
              ],
            ),
          ),
          const Padding(
              padding: EdgeInsets.all(ISizes.defaultSpace),
              child: IPromoSlider(
                banners: [
                  IImages.promoBanner1,
                  IImages.promoBanner2,
                  IImages.promoBanner3
                ],
              )),
        ],
      ),
    ));
  }
}
