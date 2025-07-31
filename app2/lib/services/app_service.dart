import 'package:get/get.dart';
import '/shared/audio_player/index.dart';

class AppService extends GetxService {
  final audioManager = AudioManager();

  @override
  void onReady() {
    super.onReady();
    audioManager.startup();
  }

  @override
  void onClose() {
    super.onClose();
    print("${runtimeType.toString()} closed");
  }
}
