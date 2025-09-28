part of 'services.dart';

class _UserService extends GetxService {
  final balance = RxNum(0);
  var refreshing = false;
  final info = VicUserModel.fromJson(storage.user.value ?? {}).obs;
  String get mobile => info.value.mobile;
  String get email => info.value.email;
  String get username => info.value.username;

  // -1 不满足条件，0 未参与，显示抽奖转盘，1.已抽奖，显示倒计时挂件，2，已抽奖，弹出奖励金额
  final lotteryStatus = (-1).obs;
  final lotteryActiveId = (-1).obs;
  final lotteryParticipateId = (-1).obs;
  final lotteryCountdown = Duration.zero.obs;
  final showLotteryPendant = false.obs;

  int get vipLevel => info.value.gradeName.toInt();
  int get id => info.value.id;

  @override
  onInit() {
    super.onInit();
    services.auth.listen((authorized) async {
      talker.log('authorized:$authorized');
      if (authorized) {
        await queryUserInfo();
        _callModals();
      } else {
        clear();
      }
    });
  }

  Future ensureInitialized() async {}

  Future queryUserInfo({bool initial = false}) async {
    if (services.auth.unauthorized) return;
    try {
      info.value = await apis.user.queryUserInfo();
      balance.value = info.value.balance;
      info.refresh();
    } catch (e) {
      Logger.error(e.toString());
      rethrow;
    }
  }

  Future updateBalance() async {
    if (services.auth.unauthorized || refreshing) return;
    refreshing = true;
    final r = await Future.wait([apis.user.queryBalance(), Future.delayed(const Duration(seconds: 1))]).whenComplete(() {
      refreshing = false;
    });
    balance.value = r[0].balance;
  }

  void clear() {
    balance.value = 0;
    info.value = VicUserModel.fromJson({});
    info.refresh();
    balance.refresh();
    lotteryStatus.value = -1;
    lotteryActiveId.value = -1;
    lotteryParticipateId.value = -1;
    lotteryCountdown.value = Duration.zero;
    showLotteryPendant.value = false;
  }

  void _callModals() async {
    if (info.value.payTimes <= 0) {
      VicModals.shared.show(VicModalName.first_deposit_bouns);
    }

    // 未绑定手机号用户弹出注册送模态窗
    if (info.value.mobile.isEmpty) {
      VicModals.shared.show(VicModalName.completion);
    }

    if (!info.value.isSignIn) {
      VicModals.shared.show(VicModalName.daily_check_in);
    }

    //TODO: 查询转盘活动
    queryLuckySpin();
  }

  queryLuckySpin() async {
    final r = await apis.user.queryLuckySpinAvalible();
    // ==0 活动未开启
    if (r.activityStatus == 0) return;
    lotteryStatus.value = r.lotteryStatus.toInt();
    // ==2 已领奖
    if (lotteryStatus.value == 2) return;

    lotteryActiveId.value = r.activityId;
    lotteryParticipateId.value = r.userParticipateInfo?.participateId ?? -1;
    lotteryCountdown.value = Duration(seconds: r.activityCountDownSeconds.toInt());

    if (lotteryStatus.value == 0) {
      VicModals().show(VicModalName.lucky_spin);
    } else if (lotteryStatus.value == 1) {
      showLotteryPendant.value = true;
    }
  }
}
