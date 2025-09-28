import 'package:get/get.dart';

import 'package:victory/apis/apis.dart';
import 'package:victory/models/daily_check_in.model.dart';

class DailyCheckInController extends GetxController {
  DailyCheckInController();

  final loading = true.obs;
  final list = <VicDailyCheckInModel>[].obs;
  final rules = ''.obs;

  void onTap() {}

  @override
  void onInit() {
    super.onInit();
    list.value = mock();
    apis.app.checkInList().then((resp) {
      if (resp == null) return;
      list.value = resp.list;
      rules.value = resp.rules;
      loading.value = false;
    });
  }

  List<VicDailyCheckInModel> mock() {
    final item = VicDailyCheckInModel(amount: 0, date: DateTime.now(), status: 0);
    return List.filled(35, item);
  }
}
