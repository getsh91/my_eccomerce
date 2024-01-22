import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/rating_and_share.dart';
import 'package:t_store/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const IBottomAddCart(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const ProductDetailImageSlider(),
          Padding(
              padding: const EdgeInsets.only(
                  left: ISizes.defaultSpace,
                  right: ISizes.defaultSpace,
                  bottom: ISizes.defaultSpace),
              child: Column(
                children: [
                  const IRateAndShare(),
                  const IProductMetaData(),
                  const IProductAttributes(),
                  const SizedBox(height: ISizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Checkout'),
                    ),
                  ),
                  const SizedBox(height: ISizes.spaceBtwSections),
                  const ISectionHeading(
                      showActionButton: false, title: 'Description'),
                  const SizedBox(height: ISizes.spaceBtwItems),
                  const ReadMoreText(
                    'The shoe typically features perforations on the toe box and sidewalls, promoting breathability and ventilation. It also includes a padded collar and tongue for added comfort and support. The lacing system allows for a secure and customizable fit.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Show less',
                    moreStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: IColors.primary),
                    lessStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: IColors.primary),
                  ),
                  const Divider(),
                  const SizedBox(height: ISizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ISectionHeading(
                          showActionButton: false,
                          title: 'Reviews(19)',
                          onPressed: () {}),
                      IconButton(
                          onPressed: () {
                            Get.to(const ProductReviews());
                          },
                          icon: const Icon(Iconsax.arrow_right_3, size: 18))
                    ],
                  ),
                  const SizedBox(height: ISizes.spaceBtwSections),
                ],
              ))
        ],
      )),
    );
  }
}
