import 'package:flutter/material.dart';
import 'package:t_store/features/shop/screens/product_reviews/widgets/progress_indicator_and_rating.dart';

class IOverallProductRating extends StatelessWidget {
  const IOverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child:
                Text('4.5', style: Theme.of(context).textTheme.displayLarge)),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              IRatingProgressIndicator(text: '5', value: 0.5),
              IRatingProgressIndicator(text: '4', value: 0.4),
              IRatingProgressIndicator(text: '3', value: 0.3),
              IRatingProgressIndicator(text: '2', value: 0.2),
            ],
          ),
        )
      ],
    );
  }
}
