part of 'services.dart';

class _UserService extends GetxService {
  final balance = RxNum(0);
  var refreshing = false;
  final info = VicUserModel.fromJson(storage.user.value ?? {}).obs;
  String get mobile => info.value.mobile;
  String get email => info.value.email;
  String get username => info.value.username;

  var luckySpinActiveId = -1;
  var luckySpinParticipateId = -1;
  final luckySpinCountdown = Duration.zero.obs;
  final luckySpinDisplay = LuckySpinDisplay.none.obs;

  int get vipLevel => info.value.gradeName.toInt();
  int get id => info.value.id;

  @override
  onInit() {
    super.onInit();
    services.auth.listen((authorized) async {
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
      final r = await apis.user.queryUserInfo();
      if (r == null) return;
      info.value = r;
      balance.value = info.value.balance;
      info.refresh();
    } catch (e) {
      talker.error(e.toString());
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
    luckySpinActiveId = -1;
    luckySpinParticipateId = -1;
    luckySpinCountdown.value = Duration.zero;
    luckySpinDisplay.value = LuckySpinDisplay.none;
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
    // ignore: dead_code, unnecessary_null_comparison
    if (r == null) return;
    talker.debug("转盘当前状态，activityStatus${r.activityStatus},lotteryStatus:${r.lotteryStatus}");
    // ==0 活动未开启
    if (r.activityStatus == 0) return;
    // ==2 已领奖
    if (r.lotteryStatus == 2) return;

    luckySpinActiveId = r.activityId;
    luckySpinParticipateId = r.userParticipateInfo?.participateId ?? -1;

    if (r.lotteryStatus == 0) {
      luckySpinDisplay.value = LuckySpinDisplay.waiting;
      VicModals().show(VicModalName.lucky_spin);
    } else {
      luckySpinDisplay.value = LuckySpinDisplay.pending;
      VicModals().show(VicModalName.lucky_spin_next);
    }

    luckySpinCountdown.value = Duration(seconds: r.activityCountDownSeconds.toInt());
  }
}
