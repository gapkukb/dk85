import 'dart:async';
import 'package:uuid/uuid.dart';
import 'package:advertising_id/advertising_id.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:mobile_device_identifier/mobile_device_identifier.dart';
import '/storage/storage.dart';

class VicAppInfo {
  static final VicAppInfo shared = VicAppInfo._internal();
  factory VicAppInfo() => shared;
  VicAppInfo._internal();

  late final String appName;
  late final String packageName;
  late final String version;
  late final String buildNumber;
  late final String deviceId;

  Future<void> ensureInitialized() async {
    if (storage.appInfo.value == null) {
      await initialize();
    } else {
      final appInfo = storage.appInfo.value!;

      appName = appInfo['appName'];
      packageName = appInfo['packageName'];
      version = appInfo['version'];
      buildNumber = appInfo['buildNumber'];
      deviceId = appInfo['deviceId'];
    }
  }

  Map<String, dynamic> toJson() => {
    "appName": appName,
    "packageName": packageName,
    "version": version,
    "buildNumber": buildNumber,
    "deviceId": deviceId,
  };

  @override
  String toString() {
    return "$appName, $packageName, $version, $buildNumber,$deviceId, ";
  }

  Future<VicAppInfo> initialize() async {
    final r = await Future.wait([PackageInfo.fromPlatform(), _findDeviceId()]);
    final PackageInfo packageInfo = r[0] as PackageInfo;

    deviceId = r[1] as String;

    appName = packageInfo.appName;
    packageName = packageInfo.packageName;
    version = packageInfo.version;
    buildNumber = packageInfo.buildNumber;
    storage.appInfo.update(toJson());

    return this;
  }
}

Future<String> _findDeviceId() async {
  String? id;
  // 优先取设备MediaDrm
  id = await MobileDeviceIdentifier().getDeviceId();
  if (id != null) return id;
  // 其次取广告id
  id = await AdvertisingId.id(true);
  if (id != null) return id;
  // 最后随机
  return const Uuid().v4();
}
