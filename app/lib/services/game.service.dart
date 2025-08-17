import 'package:get/get.dart';

import '/storage/index.dart';

class GameService extends GetConnect {
  final game = [];
  final loading = false.obs;

  queryAll() {}

  void search({String? keywords, String? kind, List<String>? platforms}) {
    print("keywords:$keywords kind:$kind platforms:$platforms");
  }

  @override
  void onInit() {
    queryAll();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    print("${runtimeType.toString()} closed");
  }
}
