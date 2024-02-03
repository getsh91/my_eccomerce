import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:t_store/common/widgets/shimmer.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class IHomeAppBar extends StatelessWidget {
  const IHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return IAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(ITexts.homeAppbarTitle,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: IColors.white)),
          Obx(() {
            if (controller.profileLoading.value) {
              //display shimmer loader while user profile is being loaded
              return const IShimmerEffect(
                height: 15,
                width: 80,
              );
            } else {
              return Text(controller.user.value.fullName,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .apply(color: IColors.white));
            }
          })
        ],
      ),
      actions: [
        ICartCounterIcon(
          onPressed: () {},
          iconColor: IColors.white,
        )
      ],
    );
  }
}
