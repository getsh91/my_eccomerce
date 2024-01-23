import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class IVerticalImageText extends StatelessWidget {
  const IVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = IColors.white,
    this.backgroundColor,
    this.onTap,
  });
  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = IHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: ISizes.spaceBtwItems),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  width: 56,
                  height: 56,
                  padding: const EdgeInsets.all(ISizes.sm),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: backgroundColor ??
                          (dark ? IColors.black : IColors.white)),
                  child: Center(
                      child: Image(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                    color: dark ? IColors.light : IColors.dark,
                  ))),
              const SizedBox(height: ISizes.spaceBtwItems / 2),
              SizedBox(
                width: 56,
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: textColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
