import 'dart:async';
import 'package:uuid/uuid.dart';
import 'package:advertising_id/advertising_id.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:mobile_device_identifier/mobile_device_identifier.dart';
import 'package:victory/helper/crypto.dart';
import 'package:victory/storage/storage.dart';

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
    final r = await Future.wait([PackageInfo.fromPlatform(), _findDeviceId()]);
    final PackageInfo packageInfo = r[0] as PackageInfo;

    deviceId = r[1] as String;
    appName = packageInfo.appName;
    packageName = packageInfo.packageName;
    version = packageInfo.version;
    buildNumber = packageInfo.buildNumber;
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
}

Future<String> _findDeviceId() async {
  String? id;
  if (storage.dviceId.value != null) return storage.dviceId.value!;
  // 优先取设备MediaDrm
  id = await MobileDeviceIdentifier().getDeviceId();
  // 其次取广告id
  id ??= await AdvertisingId.id(true);
  // 最后随机
  id ??= const Uuid().v4();
  id = VicCryptoHelper.toMd5(id);
  storage.deviceId.update(id);
  return id;
}
