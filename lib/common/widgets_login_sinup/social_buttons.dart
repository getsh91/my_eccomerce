import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ISocialButtons extends StatelessWidget {
  const ISocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: IColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
              onPressed: () {},
              icon: const Image(
                  width: ISizes.iconMd,
                  height: ISizes.iconMd,
                  image: AssetImage(IImages.google))),
        ),
        const SizedBox(width: ISizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: IColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
              onPressed: () {},
              icon: const Image(
                  width: ISizes.iconMd,
                  height: ISizes.iconMd,
                  image: AssetImage(IImages.facebook))),
        ),
      ],
    );
  }
}
