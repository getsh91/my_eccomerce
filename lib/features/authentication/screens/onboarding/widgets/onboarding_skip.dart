import 'package:flutter/material.dart';
import 'package:t_store/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: IDeviceUtils.getAppBarHeight(),
      right: ISizes.defaultSpace,
      child: TextButton(
          onPressed: () {
            OnBoardingController.instance.skipPage();
          },
          child: const Text("Skip")),
    );
  }
}
