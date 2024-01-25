import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/loaders/animation_loader.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class IFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    final dark = IHelperFunctions.isDarkMode(Get.context!);
    showDialog(
        context: Get.overlayContext!,
        barrierDismissible: false,
        builder: (_) => PopScope(
            canPop: false,
            child: Container(
              color: dark ? Colors.black : Colors.white,
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 250,
                    ),
                    IAnimationLoaderWidget(text: text, animation: animation)
                  ],
                ),
              ),
            )));
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop(); //to close dialog
  }
}
