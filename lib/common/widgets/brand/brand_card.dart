import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/images/i_circular_image.dart';
import 'package:t_store/common/widgets/texts/i_brand_title_with_verified_icon.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class IBrandCard extends StatelessWidget {
  const IBrandCard({super.key, required this.showBorder, this.onTab});

  final bool showBorder;
  final void Function()? onTab;

  @override
  Widget build(BuildContext context) {
    final dark = IHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTab,
      child: IRoundedContainer(
        padding: const EdgeInsets.all(ISizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(children: [
          Flexible(
            child: ICircularImage(
                image: IImages.nikeLogo,
                isNetwokImage: false,
                backgroundColor: Colors.transparent,
                overlayColor: dark ? IColors.white : IColors.black),
          ),
          const SizedBox(width: ISizes.spaceBtwItems / 2),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const IBrandTitleWithVerifiedIcon(
                  title: 'Nike',
                  brandTextSize: TextSizes.large,
                ),
                Text('256 products jfjsjnkns',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium)
              ],
            ),
          )
        ]),
      ),
    );
  }
}
