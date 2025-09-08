import 'dart:async';
import 'dart:io';
import 'package:advertising_id/advertising_id.dart';
import 'package:app/storage/storage.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:mobile_device_identifier/mobile_device_identifier.dart';
import 'package:uuid/uuid.dart';

class _DeviceInfo {
  late final String deviceId;

  Future<String> _get() async {
    // 优先取设备MediaDrm
    String? id;
    id = await MobileDeviceIdentifier().getDeviceId();
    if (id != null) return id;

    // 其次优先取广告id
    try {
      id = await AdvertisingId.id(true);
      if (id != null) return id;
    } on PlatformException {
      debugPrint('获取广告id失败');
    }

    // 还拿不到则取设备指纹并拼接uuid

    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      final uuid = Uuid();
      id = uuid.v1();
      id += androidInfo.fingerprint;
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      id = iosInfo.identifierForVendor ?? id;
    } else if (kIsWeb) {
      final info = await deviceInfo.webBrowserInfo;
      id = info.vendor;
    }

    return id!;
  }

  Future<String> _getId() async {
    final id = await _get();
    return Uuid().v5(Namespace.nil.value, id);
  }

  Future initialize() async {
    if (storage.deviceId.value.isEmpty) {
      final id = await _getId();
      storage.deviceId.update(id);
    }
    deviceId = storage.deviceId.value;
  }
}

final deviceInfo = _DeviceInfo();
