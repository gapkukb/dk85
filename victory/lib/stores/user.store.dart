part of 'stores.dart';

class _UserService extends GetxService {
  final balance = RxNum(0);
  var refreshing = false;
  final info = VicUserModel.fromJson(storage.user.value ?? {}).obs;

  Future queryUserInfo({bool updateBalance = false, bool initial = false}) async {
    try {
      info.value = await apis.user.queryUserInfo();
      info.refresh();
      if (updateBalance == true) {
        queryBalance();
      }
    } catch (e) {
      Logger.error(e.toString());
      rethrow;
    }
  }

  Future queryBalance() async {
    if (stores.auth.unauthorized || refreshing) return;
    refreshing = true;
    final r = await Future.wait([apis.user.queryBalance(), Future.delayed(const Duration(seconds: 1))]).whenComplete(() {
      refreshing = false;
    });
    balance.value = r[0].balance;
  }

  @override
  onInit() {
    super.onInit();
    if (stores.auth.authorized) {
      queryUserInfo();
      queryBalance();
    }
  }

  Future ensureInitialized() async {}
}
