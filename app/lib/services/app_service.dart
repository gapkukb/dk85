import 'package:get/get.dart';
import '../shared/audio_manager/index.dart';

class AppService extends GetxService {
  final audioManager = AudioManager();

  @override
  void onClose() {
    super.onClose();
    print("${runtimeType.toString()} closed");
  }
}
