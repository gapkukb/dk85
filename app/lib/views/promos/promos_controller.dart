import 'package:app/apis/apis.dart';
import 'package:app/models/ad_list.model.dart';
import 'package:get/get.dart';

class PromosController extends GetxController {
  final promos = <AdModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    apis.app.queryAdList(queryParameters: {'type': '3', 'position': '5'}).then((value) {
      promos.value = value.data;
    });
  }
}
