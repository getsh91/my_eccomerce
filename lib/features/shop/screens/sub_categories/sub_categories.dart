import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/images/i_rounded_image.dart';
import 'package:t_store/common/widgets/products/product_card/product_card_horizontal.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const IAppBar(
        title: Text('Sport Shirts'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ISizes.defaultSpace),
          child: Column(children: [
            const IRoundedImage(
                imageUrl: IImages.promoBanner1,
                width: double.infinity,
                applyImageRadius: true),
            const SizedBox(height: ISizes.spaceBtwSections),
            Column(
              children: [
                ISectionHeading(title: 'Sport shirts', onPressed: () {}),
                const SizedBox(height: ISizes.spaceBtwItems / 2),
                SizedBox(
                    height: 120,
                    child: ListView.separated(
                        itemCount: 6,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (_, __) =>
                            const SizedBox(width: ISizes.spaceBtwItems),
                        itemBuilder: (_, index) =>
                            const IProductCardHorizontal()))
              ],
            )
          ]),
        ),
      ),
    );
  }
}
