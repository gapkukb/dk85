import 'package:app/apis/index.dart';
import 'package:app/models/ad_list.model.dart';
import 'package:get/get.dart';

class PromosController extends GetxController {
  final promos = <AdModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    queryAdList(queryParameters: {'type': '3', 'position': '5'}).then((value) {
      promos.value = value.data;
    });
  }
}
