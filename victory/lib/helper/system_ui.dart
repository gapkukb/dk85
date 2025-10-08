import 'package:flutter/services.dart';
import 'package:scaled_app/scaled_app.dart';
import 'package:flutter/material.dart';

final class SystemUIHelper {
  static void ensureInitialized() {
    ScaledWidgetsFlutterBinding.ensureInitialized(
      scaleFactor: (deviceSize) => deviceSize.width / 375,
    );
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    // 设置状态栏透明并防止状态栏变黑
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // 设置状态栏透明
        statusBarIconBrightness: Brightness.dark, // 设置状态栏图标颜色为深色
        systemNavigationBarColor: Colors.transparent, // 设置导航栏透明
        systemNavigationBarIconBrightness: Brightness.dark, // 设置导航栏图标颜色为深色
      ),
    );
  }
}
