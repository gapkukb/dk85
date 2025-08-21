import 'package:restart_app/restart_app.dart';

void reloadApp() {
  Restart.restartApp(
    /// In Web Platform, Fill webOrigin only when your new origin is different than the app's origin
    // webOrigin: 'http://example.com',

    // Customizing the restart notification message (only needed on iOS)
    notificationTitle: 'Restarting App',
    notificationBody: 'Please tap here to open the app again.',
  );
}
