import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class VicViewModel extends GetxController {
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
    page = 1;
    load();
    refresher.refreshCompleted(resetFooterState: true);
  }

  void onLoading() async {
    print('onLoading');
    await Future.delayed(const Duration(seconds: 10));
    page++;
    loader();
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
