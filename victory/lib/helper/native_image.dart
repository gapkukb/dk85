import 'package:flutter/services.dart';

class NativeBridge {
  static const MethodChannel _channel = MethodChannel('victory_native_channel');

  /// 传入带后缀的图片名称，比如 "ic_launcher.png"
  static Future<String> nativeImage(String fileNameWithSuffix) async {
    try {
      final String path = await _channel.invokeMethod('native_image', {'name': fileNameWithSuffix});
      return path;
    } catch (e) {
      return "null";
    }
  }
}

abstract class NativeImage {
  static late final String logo;
  static late final String logoLight;
  static late final String splash;

  static ensureInitialized() async {
    logo = await NativeBridge.nativeImage('logo.webp');
    splash = await NativeBridge.nativeImage('splash.webp');
  }
}
