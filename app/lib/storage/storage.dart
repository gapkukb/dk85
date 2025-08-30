part of 'index.dart';

late final Storage storage;

class Storage {
  static Future setup() {
    return Future.wait([
      GetStorage.init(_appName),
      GetStorage.init(_gameName),
      GetStorage.init(_userName),
    ]).then((_) {
      storage = Storage();
    });
  }

  final locale = _StorageItem<String>(app, "locale", I18n.defaultLocale.code);

  /// 设备的唯一识别符
  final deviceId = _StorageStaticItem<String>(app, "device_id", '');
  // final deviceInfo = _StorageStaticItem<String>(_global, "device_info", null);
  final music = _StorageItem<bool>(app, "music", true);
  final token = _StorageItem<String>(app, "token", '');
  final showGuide = _StorageItem<bool>(app, "show_guide", true);
  final user = _StorageItem<Map<String, dynamic>?>(_user, "user", null);
  final allGame = _StorageItem<Object>(_user, "all_game", '');
}
