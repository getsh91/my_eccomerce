import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/common_widgets_image_text/vertical_image_text.dart';
import 'package:t_store/features/shop/screens/sub_categories/sub_categories.dart';
import 'package:t_store/utils/constants/image_strings.dart';

class IHomeCatagories extends StatelessWidget {
  const IHomeCatagories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 80,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return IVerticalImageText(
                image: IImages.shoeIcon,
                title: 'shoes',
                onTap: () {
                  Get.to(const SubCategoriesScreen());
                },
              );
            }));
  }
}
