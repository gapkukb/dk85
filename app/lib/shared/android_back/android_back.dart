import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 返回到手机桌面,保持后台运行,操作系统不同存活时间不同
class AndroidBack {
  static Future<bool> back() async {
    const platform = MethodChannel('my.channel');
    print("moveTaskToBack");
    try {
      final bool out = await platform.invokeMethod('moveTaskToBack');
      if (out) debugPrint("返回到手机桌面");
    } on PlatformException catch (e) {
      debugPrint("通信失败（设置返回到安卓手机桌面：设置失败）");
      debugPrint(e.toString());
    }
    return Future.value(false);
  }
}
