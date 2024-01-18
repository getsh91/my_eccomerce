import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/seach_container.dart';
import 'package:t_store/common/widgets/images/i_circular_image.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products_cart/cart_menu_icon.dart';
import 'package:t_store/common/widgets/texts/i_brand_title_with_verified_icon.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = IHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: IAppBar(
        title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
        actions: [ICartCounterIcon(onPressed: () {})],
      ),
      body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: dark ? Colors.black : Colors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(ISizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const SizedBox(height: ISizes.spaceBtwItems),
                      const ISearchContainer(
                          text: 'Search for Store',
                          showBorder: true,
                          padding: EdgeInsets.zero,
                          showBackground: false),
                      const SizedBox(height: ISizes.spaceBtwSections),
                      ISectionHeading(
                        title: 'Features Brands',
                        onPressed: () {},
                        showActionButton: true,
                      ),
                      const SizedBox(height: ISizes.spaceBtwItems / 1.5),
                      IGridLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          return GestureDetector(
                            onTap: () {},
                            child: IRoundedContainer(
                              padding: const EdgeInsets.all(ISizes.sm),
                              showBorder: true,
                              backgroundColor: Colors.transparent,
                              child: Row(children: [
                                Flexible(
                                  child: ICurcularImage(
                                      image: IImages.clothIcon,
                                      isNetwokImage: false,
                                      backgroundColor: Colors.transparent,
                                      overlayColor:
                                          dark ? IColors.white : IColors.black),
                                ),
                                const SizedBox(width: ISizes.spaceBtwItems / 2),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const IBrandTitleWithVerifiedIcon(
                                        title: 'Nike',
                                        brandTextSize: TextSizes.large,
                                      ),
                                      Text('256 products jfjsjnkns',
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium)
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              )
            ];
          },
          body: Container()),
    );
  }
}
