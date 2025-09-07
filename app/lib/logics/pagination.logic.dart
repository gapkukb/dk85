import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

mixin class PaginationLogic<T> {
  final list = <T>[].obs;
  final initialLoading = true.obs;
  final loading = true.obs;
  final refresher = RefreshController();
  int page = 1;
  int get fakerCount => 10;
  int get size => 50;
  T get fakerItem => throw NoSuchMethodError;
  List<T> get faker => List.filled(fakerCount, fakerItem);

  Future<({List<T> data, int count})> fetch() async {
    throw '必须实现 fetch 方法';
  }

  dispatch() async {
    try {
      final batch = await Future.wait([fetch(), Future.delayed(const Duration(seconds: 1))]);
      final resp = batch.first as ({int count, List<T> data});
      if (page == 1) {
        list.value = resp.data;
      } else {
        list.addAll(resp.data);
      }
      if (list.length >= resp.count) {
        refresher.loadNoData();
      } else {
        refresher.loadComplete();
      }
      print('ssss,${list.toString()}');
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    } finally {
      initialLoading.value = false;
    }
  }

  onRefresh() async {
    page = 1;
    await dispatch();
    refresher.refreshCompleted(resetFooterState: true);
  }

  onLoading() async {
    page++;
    await dispatch();
  }

  reset() {
    refresher.refreshToIdle();
    page = 1;
    list.value = faker;
    initialLoading.value = true;
    dispatch();
  }
}
