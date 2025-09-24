import 'package:get/get.dart';

import '../../apis/apis.dart';
import '../../models/models.dart';

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
