import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // 设置状态栏透明
        statusBarIconBrightness: Brightness.dark, // 设置状态栏图标颜色为深色
        systemNavigationBarColor: Colors.transparent, // 设置导航栏透明
        systemNavigationBarIconBrightness: Brightness.dark, // 设置导航栏图标颜色为深色
      ),
    );
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.red);
  }
}
