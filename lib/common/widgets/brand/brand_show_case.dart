import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/brand/brand_card.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class IBrandShowcase extends StatelessWidget {
  const IBrandShowcase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return IRoundedContainer(
      showBorder: true,
      backgroundColor: Colors.transparent,
      borderColor: IColors.darkGrey,
      margin: const EdgeInsets.only(bottom: ISizes.spaceBtwItems),
      padding: const EdgeInsets.all(ISizes.md),
      child: Column(
        children: [
          const IBrandCard(showBorder: false),
          Row(
              children: images
                  .map((image) => brandTopProductImageWidget(image, context))
                  .toList())
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    final dark = IHelperFunctions.isDarkMode(context);
    return Expanded(
      child: IRoundedContainer(
        height: 100,
        backgroundColor: dark ? IColors.darkerGrey : IColors.light,
        margin: const EdgeInsets.only(right: ISizes.sm),
        padding: const EdgeInsets.all(ISizes.md),
        child: Image(image: AssetImage(image), fit: BoxFit.cover),
      ),
    );
  }
}
