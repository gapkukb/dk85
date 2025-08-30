import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class ViewModel extends GetxController {
  int page = 1;
  final int size = 50;
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

  void onRefresh() async {
    debugPrint('onRefresh');
    await Future.delayed(Durations.medium1);
    refresher.refreshCompleted(resetFooterState: true);
  }

  void onLoading() async {
    debugPrint('onLoading');
    await Future.delayed(Durations.medium1);
    refresher.loadNoData();
  }

  @override
  void onInit() {
    load();
    super.onInit();
  }

  @override
  void onClose() {
    refresher.dispose();
    super.onClose();
  }
}
