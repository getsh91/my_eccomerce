import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/shimmer.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class ICircularImage extends StatelessWidget {
  const ICircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.padding = ISizes.sm,
    required this.image,
    this.backgroundColor,
    this.overlayColor,
    this.fit = BoxFit.cover,
    this.isNetwokImage = false,
  });

  final double? width, height, padding;
  final String image;
  final Color? backgroundColor;
  final Color? overlayColor;
  final BoxFit? fit;
  final bool isNetwokImage;

  @override
  Widget build(BuildContext context) {
    final dark = IHelperFunctions.isDarkMode(context);
    return Container(
        width: 56,
        height: 56,
        padding: const EdgeInsets.all(ISizes.sm),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: backgroundColor ?? (dark ? IColors.black : IColors.white),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Center(
              child: isNetwokImage
                  ? CachedNetworkImage(
                      color: overlayColor,
                      fit: fit,
                      imageUrl: image,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              const IShimmerEffect(
                                  height: 55, width: 55, radius: 55),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    )
                  : Image(
                      image: isNetwokImage
                          ? NetworkImage(image)
                          : AssetImage(image) as ImageProvider,
                      fit: fit,
                      color: overlayColor,
                    )),
        ));
  }
}
