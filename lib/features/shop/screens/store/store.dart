import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/seach_container.dart';
import 'package:t_store/common/widgets/products_cart/cart_menu_icon.dart';
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
                    children: const [
                      SizedBox(height: ISizes.spaceBtwItems),
                      ISearchContainer(
                          text: 'Search for Store',
                          showBorder: true,
                          padding: EdgeInsets.zero,
                          showBackground: false),
                      SizedBox(height: ISizes.spaceBtwSections),
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
