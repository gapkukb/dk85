import 'package:get/get.dart';
import 'package:victory/apis/apis.dart';
import 'package:victory/models/vip.model.dart';
import 'package:victory/shared/dialogs/dialog.dart';
import 'package:victory/services/services.dart';

class RebateController extends GetxController {
  RebateController();
  final loading = true.obs;
  final config = List<VicVipLevelModel>.filled(13, VicVipLevelModel.fromJson({})).obs;
  num get amount => services.user.info.value.totalRebateAmount;

  @override
  void onInit() {
    _queryConfig();
    super.onInit();
  }

  void cliam() async {
    await apis.user.rebate();
    services.user.queryUserInfo(updateBalance: true);
    await VicDialog.success();
  }

  void _queryConfig() async {
    config.value = await apis.user.queryGradeList().whenComplete(() {
      loading.value = false;
    });
  }
}
