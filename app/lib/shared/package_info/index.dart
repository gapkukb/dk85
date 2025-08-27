import 'package:package_info_plus/package_info_plus.dart';

class _PackageInfo {
  late final PackageInfo info;

  Future setup() async {
    info = await PackageInfo.fromPlatform();
  }
}

final packageInfo = _PackageInfo();
