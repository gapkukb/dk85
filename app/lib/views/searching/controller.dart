import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class _Tab {
  final String name;
  final String value;

  _Tab({required this.name, required this.value});
}

class SearchingController extends GetxController
    with GetSingleTickerProviderStateMixin {
  SearchingController();

  late final TabController tab;
  final input = TextEditingController();

  final List<_Tab> tabs = [
    _Tab(name: 'All', value: 'all'),
    _Tab(name: 'app.slots', value: 'slots'),
    _Tab(name: 'app.fishing', value: 'fishing'),
    _Tab(name: 'app.poker', value: 'poker'),
  ];

  final List<Map<String, String>> platforms = [];
  // tap
  void search([dynamic _]) {
    final keywords = input.text.trim();
    final kind = tabs[tab.index].value;
    final platform = '';

    Get.snackbar("标题", "keywords:$keywords,kind:$kind");
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    tab = TabController(length: tabs.length, vsync: this);
    super.onInit();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    tab.dispose();
    input.dispose();
    super.dispose();
  }
}
