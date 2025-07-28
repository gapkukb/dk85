import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ForuController extends GetxController {
  ForuController();
  final refreshController = RefreshController(initialRefresh: false);

  void onRefresh() {}
  void onLoadMore() async {
    await Future.delayed(Durations.medium2);
    refreshController.loadNoData();
  }

  @override
  void dispose() {
    super.dispose();
    refreshController.dispose();
  }
}
