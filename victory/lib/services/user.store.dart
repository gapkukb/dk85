part of 'services.dart';

class _UserService extends GetxService with LuckyWheelMixin {
  final balance = RxNum(0);
  var refreshing = false;
  final info = VicUserModel.fromJson(storage.user.value ?? {}).obs;
  String get mobile => info.value.mobile;
  String get email => info.value.email;
  String get username => info.value.username;

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
    apis.user.queryUserInfo.abort();
    balance.value = 0;
    info.value = VicUserModel.fromJson({});
    info.refresh();
    balance.refresh();
    clearLuckyWheel();
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

    queryLuckyWheel();
  }
}
