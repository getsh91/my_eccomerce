import 'package:get/get.dart';

class HomeController extends GetxController {
  var carousalCurrentIndex = 0.obs;
  static HomeController get instance => Get.find();

  void changePageIndicator(int index) {
    carousalCurrentIndex.value = index;
  }
}
