import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/features/shop/screens/product_reviews/widgets/product_overall_rating.dart';
import 'package:t_store/common/widgets/products/rating/rating_bar_indicator.dart';
import 'package:t_store/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ProductReviews extends StatelessWidget {
  const ProductReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const IAppBar(
        title: Text('Reviews & Ratings'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ISizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'Ratings and reviews are provided by customers who have '
                  'either purchased a vehicle or visited a dealership for service.'),
              const SizedBox(height: ISizes.spaceBtwItems),
              const IOverallProductRating(),
              const IRatingBarIndicator(
                rating: 4.5,
              ),
              Text('100', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: ISizes.spaceBtwSections),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
