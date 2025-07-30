import 'package:get/get.dart';

import '../storage/index.dart';

class AppService extends GetxService {
  final music = Storage.music;

  switchMusic(bool enable) {
    music.value = enable;
  }

  @override
  void onClose() {
    super.onClose();
    print("${runtimeType.toString()} closed");
  }
}
