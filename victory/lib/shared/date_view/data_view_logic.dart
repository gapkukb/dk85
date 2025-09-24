import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class DataViewLogic<T> extends GetxController {
  final initialLoading = true.obs;
  final loading = false.obs;
  final data = <T>[].obs;
  RefreshController refresher = RefreshController();
  int page = 1;
  int size = 50;
  int count = 0;

  @override
  void onInit() {
    _load();
    super.onInit();
  }

  @override
  onClose() {
    data.clear();
    refresher.dispose();
  }

  Future<void> _load() async {
    if (loading.value) return;
    loading.value = true;
    return fetch()
        .then((value) {
          if (page == 1) {
            data.assignAll(value);
          } else {
            data.addAll(value);
          }
          if (count <= page * size) {
            refresher.loadNoData();
          }
        })
        .whenComplete(() {
          loading.value = initialLoading.value = false;
        });
  }

  void onRefresh() async {
    page = 1;
    return _load()
        .then((_) {
          refresher.refreshCompleted(resetFooterState: true);
        })
        .catchError((e) {
          refresher.refreshFailed();
          throw e;
        });
  }

  void loadMore() async {
    page++;
    return _load()
        .catchError((e) {
          refresher.loadFailed();
          throw e;
        })
        .then((_) {
          if (count > page * size) {
            refresher.loadComplete();
          } else {
            refresher.loadNoData();
          }
        });
  }

  reset() {
    page = 1;
    initialLoading.value = true;
    _load();
  }

  Future<List<T>> fetch();
  List<T> provideMock();
}
