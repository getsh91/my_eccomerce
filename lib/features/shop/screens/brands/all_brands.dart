import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/brand/brand_card.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/screens/brands/brand_products.dart';
import 'package:t_store/utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const IAppBar(
        title: Text('Popular Products'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ISizes.defaultSpace),
          child: Column(children: [
            const ISectionHeading(title: 'Brands', showActionButton: true),
            const SizedBox(height: ISizes.spaceBtwItems),
            IGridLayout(
                itemCount: 8,
                mainAxisExtent: 80,
                itemBuilder: (_, index) => IBrandCard(
                      showBorder: true,
                      onTab: () {
                        Get.to(const BrandProducts());
                      },
                    ))
          ]),
        ),
      ),
    );
  }
}
