import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForuController extends GetxController {
  ForuController();

  void onRefresh() {}
  void onLoadMore() async {
    await Future.delayed(Durations.medium2);
  }
}
