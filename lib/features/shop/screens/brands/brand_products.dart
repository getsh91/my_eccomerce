import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/brand/brand_card.dart';
import 'package:t_store/common/widgets/products/sortable/sortable_products.dart';
import 'package:t_store/utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: IAppBar(
          title: Text('Nike'),
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.all(ISizes.defaultSpace),
          child: Column(children: [
            IBrandCard(showBorder: true),
            SizedBox(height: ISizes.spaceBtwSections),
            ISortableProducts()
          ]),
        )));
  }
}
