import 'package:get/get.dart';

import '../../apis/apis.dart';
import '../../helper/success.dart';
import '../../models/vip.model.dart';
import '../../stores/stores.dart';

class RebateController extends GetxController {
  RebateController();
  final loading = true.obs;
  final config = List<VicVipLevelModel>.filled(13, VicVipLevelModel.fromJson({})).obs;
  num get amount => stores.user.info.value.totalRebateAmount;

  @override
  void onInit() {
    _queryConfig();
    super.onInit();
  }

  void cliam() async {
    await apis.user.rebate();
    stores.user.queryUserInfo(updateBalance: true);
    await showSuccess();
  }

  void _queryConfig() async {
    config.value = await apis.user.queryGradeList().whenComplete(() {
      loading.value = false;
    });
  }
}
