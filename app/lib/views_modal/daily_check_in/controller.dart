import 'package:app/apis/apis.dart';
import 'package:app/models/daily_check_in.model.dart';
import 'package:get/get.dart';

class DailyCheckInController extends GetxController {
  DailyCheckInController();

  final loading = true.obs;
  final list = <DailyCheckInModel>[].obs;

  void onTap() {}

  @override
  void onInit() {
    super.onInit();
    list.value = mock();
    apis.app.checkInList().then((resp) {
      list.value = resp.data;
      loading.value = false;
    });
  }

  List<DailyCheckInModel> mock() {
    final item = DailyCheckInModel(amount: 0, date: DateTime.now(), status: 0);
    return List.filled(35, item);
  }
}
