import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:victory/apis/apis.dart';
import 'package:victory/modals/modals.dart';
import 'package:victory/shared/dialogs/dialog.dart';
import 'package:victory/shared/talker/talker.dart';

enum LuckyWheelDisplay {
  none,
  waiting,
  pending,
  miniWaiting,
  miniPending,
}

mixin LuckyWheelMixin {
  // -1 不满足条件，0 未参与，显示抽奖转盘，1.已抽奖，显示倒计时挂件，2，已抽奖，弹出奖励金额
  var luckyWheelActiveId = -1;
  var luckyWheelParticipateId = -1;
  final luckyWheelCountdown = Duration.zero.obs;
  final luckyWheelDisplay = LuckyWheelDisplay.none.obs;

  bool get showLuckWheelEntry => luckyWheelDisplay.value == LuckyWheelDisplay.miniWaiting || luckyWheelDisplay.value == LuckyWheelDisplay.miniPending;

  clearLuckyWheel() {
    luckyWheelActiveId = -1;
    luckyWheelParticipateId = -1;
    luckyWheelCountdown.value = Duration.zero;
    luckyWheelDisplay.value = LuckyWheelDisplay.none;
  }

  Future queryLuckyWheel() async {
    final r = await apis.user.queryLuckySpinAvalible();
    // ignore: dead_code, unnecessary_null_comparison
    if (r == null) return;
    talker.debug("转盘当前状态，activityStatus${r.activityStatus},lotteryStatus:${r.lotteryStatus}");
    // ==0 活动未开启
    // ==2 已领奖
    if (r.activityStatus == 0 || r.lotteryStatus == 2) return;

    luckyWheelActiveId = r.activityId;
    luckyWheelParticipateId = r.userParticipateInfo?.participateId ?? -1;
    luckyWheelCountdown.value = Duration(seconds: r.activityCountDownSeconds.toInt());

    if (r.lotteryStatus == 0) {
      VicModals.shared.show(VicModalName.lucky_spin);
      luckyWheelDisplay.value = LuckyWheelDisplay.waiting;
    } else {
      luckyWheelDisplay.value = LuckyWheelDisplay.miniPending;
    }
  }

  Future drawLuckyWheel() async {
    try {
      return apis.user.drawLuckySpin(
        payload: {
          "activity_id": luckyWheelActiveId,
          "participate_id": luckyWheelParticipateId,
        },
      );
    } on DioException catch (e) {
      if (e.message != null) {
        VicDialog.luckyspin(title: e.message!, onTap: () => Get.back());
      }
      rethrow;
    }
  }

  Future finishLuckyWheel() async {
    luckyWheelDisplay.value = LuckyWheelDisplay.none;
    return queryLuckyWheel();
  }

  Future<double> cliamLuckyWheel() async {
    try {
      final r = await apis.user.claimLuckySpin(
        payload: {
          "activity_id": luckyWheelActiveId,
          "participate_id": luckyWheelParticipateId,
        },
      );
      if (r == null) return 0.0;
      return r.priceAmount.toDouble();
    } on DioException catch (e) {
      if (e.message != null) {
        VicDialog.luckyspin(title: e.message!, onTap: () => Get.back());
      }
      rethrow;
    }
  }
}
