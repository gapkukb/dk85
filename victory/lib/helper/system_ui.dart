import 'package:flutter/services.dart';
import 'package:scaled_app/scaled_app.dart';
import 'package:flutter/material.dart';

final class SystemUIHelper {
  static void ensureInitialized() {
    ScaledWidgetsFlutterBinding.ensureInitialized(
      scaleFactor: (deviceSize) => deviceSize.width / 375,
    );
    restore();
  }

  static void immersiveSticky() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  static void immersive() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  static void edgeToEdge() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  static void lockOrientation() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  static void unlockOrientation() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  static void transparentStatus() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // 设置状态栏透明
        statusBarIconBrightness: Brightness.dark, // 设置状态栏图标颜色为深色
        systemNavigationBarColor: Colors.transparent, // 设置导航栏透明
        systemNavigationBarIconBrightness: Brightness.dark, // 设置导航栏图标颜色为深色
      ),
    );
  }

  static void restore() {
    edgeToEdge();
    transparentStatus();
    lockOrientation();
  }
}
