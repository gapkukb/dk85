import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../services/index.dart';

import 'index.dart';

class SearchingController extends GetxController with GetSingleTickerProviderStateMixin {
  SearchingController();
  late final TabController kind;
  final keywords = TextEditingController();
  final state = SearchingState();
  final gameService = Get.find<GameService>();

  void search([dynamic value]) {
    gameService.search(keywords: keywords.text, kind: state.kinds[kind.index].value, platforms: state.platforms);
  }

  void onSuffixTap() {
    search(keywords.text);
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    kind = TabController(length: state.kinds.length, vsync: this);
    kind.index;
    super.onInit();
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
    kind.dispose();
    keywords.dispose();
  }
}
