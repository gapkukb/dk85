part of 'index.dart';

class MoreViewController extends GetxController {
  final bgmPlayable = false.obs;

  switchPlayable(bool value) {
    bgmPlayable.value = value;
  }
}
