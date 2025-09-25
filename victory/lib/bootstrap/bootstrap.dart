import 'package:scaled_app/scaled_app.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:victory/helper/charles_monitor.dart';
import 'package:victory/modals/modals.dart';
import 'package:victory/shared/app_info/app_info.dart';
import 'package:victory/storage/storage.dart';
import 'package:victory/services/services.dart';

/// APP启动初始化
Future<void> bootstrap() async {
  await Storage.ensureInitialized();
  await CharlesProxyHttpOverride.ensureInitialized();
  await VicAppInfo().ensureInitialized();
  await services.ensureInitialized();
}

void setupSystemUI() {
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
