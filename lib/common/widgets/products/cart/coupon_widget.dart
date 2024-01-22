import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class ICouponCode extends StatelessWidget {
  const ICouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = IHelperFunctions.isDarkMode(context);
    return IRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? IColors.dark : IColors.white,
      padding: const EdgeInsets.all(ISizes.sm),
      child: Row(
        children: [
          Flexible(
              child: TextFormField(
            decoration: const InputDecoration(
              hintText: 'Have a promo code? Enter here',
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
          )),
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Apply'),
            ),
          )
        ],
      ),
    );
  }
}
