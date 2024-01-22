import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/appbar/tabbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/seach_container.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/brand/brand_card.dart';
import 'package:t_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/screens/store/widgets/category_tab.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = IHelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: IAppBar(
          title:
              Text('Store', style: Theme.of(context).textTheme.headlineMedium),
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
                              return IBrandCard(showBorder: true, onTab: () {});
                            },
                          )
                        ],
                      ),
                    ),
                    bottom: const ITabBar(tabs: [
                      Tab(child: Text('Elecronics')),
                      Tab(child: Text('Clothing')),
                      Tab(child: Text('Shoes')),
                      Tab(child: Text('Bags')),
                      Tab(child: Text('Watches')),
                    ]))
              ];
            },
            body: const TabBarView(
              children: [
                ICategoryTab(),
                ICategoryTab(),
                ICategoryTab(),
                ICategoryTab(),
                ICategoryTab(),
              ],
            )),
      ),
    );
  }
}
