import 'package:app/apis/apis.dart';
import 'package:app/models/daily_check_in.model.dart';
import 'package:get/get.dart';

class DailyCheckInController extends GetxController {
  DailyCheckInController();

  final list = <DailyCheckInModel>[].obs;

  void onTap() {}

  @override
  void onInit() {
    super.onInit();
    apis.app.checkInList().then((resp) {
      list.value = resp.data;
    });
  }
}
