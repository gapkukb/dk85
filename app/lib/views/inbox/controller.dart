import 'package:app/apis/apis.dart';
import 'package:app/models/inbox.model.dart';
import 'package:app/shared/view_model/view_model.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/src/smart_refresher.dart';

import 'index.dart';

class InboxController extends GetxController {
  // InboxController();
  final loading = true.obs;
  final messages = <InboxModel>[].obs;
  final refresher = RefreshController();

  @override
  void onInit() {
    queryInbox();
    super.onInit();
  }

  Future queryInbox() async {
    await Future.delayed(Duration(seconds: 3));
    final r = await apis.user.queryInbox(payload: {'page': 1, 'size': 100}).whenComplete(() {
      loading.value = false;
    });
    messages.value = r.data.list ?? [];
  }

  void onRefresh() async {}
  void onLoading() async {}
}
