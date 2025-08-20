import 'package:get/get.dart';
import 'package:app/shared/reload/reload.dart';
import 'package:restart_app/restart_app.dart';

class AppService extends GetxService {
  static AppService get to => Get.find();

  void reloadApp() {
    Restart.restartApp(
      /// In Web Platform, Fill webOrigin only when your new origin is different than the app's origin
      // webOrigin: 'http://example.com',

      // Customizing the restart notification message (only needed on iOS)
      notificationTitle: 'Restarting App',
      notificationBody: 'Please tap here to open the app again.',
    );
  }
}
