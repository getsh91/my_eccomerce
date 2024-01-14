import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:t_store/common/widgets/images/i_rounded_image.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/controllers/home_controller.dart';

class IPromoSlider extends StatelessWidget {
  const IPromoSlider({
    super.key,
    required this.banners,
  });
  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          items: banners.map((url) => IRoundedImage(imageUrl: url)).toList(),
          options: CarouselOptions(
            // autoPlay: true,
            // aspectRatio: 2.0,
            // enlargeCenterPage: true,
            viewportFraction: 1,
            onPageChanged: (index, _) {
              controller.changePageIndicator(index);
            },
          ),
        ),
        const SizedBox(height: ISizes.spaceBtwItems),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)
                  ICircularContainer(
                    width: 20,
                    height: 4,
                    background: controller.carousalCurrentIndex.value == i
                        ? IColors.primary
                        : IColors.grey,
                    margin: const EdgeInsets.only(right: 10),
                  )
              ],
            ),
          ),
        )
      ],
    );
  }
}
