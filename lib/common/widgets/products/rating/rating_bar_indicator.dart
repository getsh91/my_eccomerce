import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:t_store/utils/constants/colors.dart';

class IRatingBarIndicator extends StatelessWidget {
  const IRatingBarIndicator({
    super.key,
    required this.rating,
  });
  final double rating;
  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      itemBuilder: (_, __) => const Icon(Icons.star, color: IColors.primary),
      rating: rating,
      itemCount: 5,
      itemSize: 20,
      unratedColor: IColors.grey,
      direction: Axis.horizontal,
    );
  }
}
