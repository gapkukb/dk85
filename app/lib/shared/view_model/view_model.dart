import 'dart:async';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class ViewModel extends GetxController {
  final refresher = RefreshController();
  final loading = false.obs;
  final loadFailed = false.obs;
  Future loader();

  void load() {
    loading.value = true;
    loadFailed.value = false;
    loader()
        .catchError((_) {
          loadFailed.value = true;
        })
        .whenComplete(() => loading.value = false);
  }

  @override
  void onInit() {
    load();
    super.onInit();
  }

  @override
  void dispose() {
    refresher.dispose();
    super.dispose();
  }
}
