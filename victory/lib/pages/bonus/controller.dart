import 'package:get/get.dart';

import 'package:victory/apis/apis.dart';
import 'package:victory/models/models.dart';

class VicBonusController extends GetxController {
  final data = <VicBannerModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    apis.app.queryAdList(queryParameters: {'type': '3', 'position': '5'}).then((value) {
      data.value = value ?? [];
    });
  }
}
