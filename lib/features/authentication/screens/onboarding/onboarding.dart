import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import './widgets/onboarding_page.dart';
import './widgets/onboarding_skip.dart';
import './widgets/onboarding_dot_navigation.dart';
import './widgets/onboarding_next_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: IImages.onBoardingImage1,
                title: ITexts.onBoardingTitle1,
                subtitle: ITexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: IImages.onBoardingImage2,
                title: ITexts.onBoardingTitle2,
                subtitle: ITexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: IImages.onBoardingImage3,
                title: ITexts.onBoardingTitle3,
                subtitle: ITexts.onBoardingSubTitle3,
              ),
            ],
          ),
          const OnBoardingSkip(),
          const OnBoardingDotNavigation(),
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}
