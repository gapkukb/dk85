import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class VipController extends GetxController {
  VipController();

  final page = 0.obs;
  final carousel = CarouselSliderController();

  void onCarouselPageChanged(int index, CarouselPageChangedReason reason) {
    page.value = index;
  }
}
