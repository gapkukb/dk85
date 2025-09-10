import 'package:app/apis/apis.dart';
import 'package:app/extensions/bot_toast.dart';
import 'package:app/models/vip.model.dart';
import 'package:app/services/index.dart';
import 'package:get/get.dart';

class RebateController extends GetxController {
  RebateController();
  final loading = true.obs;
  final config = List<VipModel>.filled(13, VipModel.fromJson({})).obs;
  num get amount => services.user.userInfo.value!.totalRebateAmount;

  @override
  void onInit() {
    _queryConfig();
    super.onInit();
  }

  void cliam() async {
    await apis.user.rebate();
    services.user.queryUserInfo(true);
    await showSuccess();
  }

  void _queryConfig() async {
    final r = await apis.user.queryGradeList().whenComplete(() {
      loading.value = false;
    });
    config.value = r.data;
  }
}
