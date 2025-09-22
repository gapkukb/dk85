part of 'stores.dart';

class _UserService extends GetxService {
  final balance = RxNum(0);
  var refreshing = false;
  final info = UserModel.fromJson({}).obs;

  Future queryUserInfo({bool updateBalance = false, bool initial = false}) async {
    try {
      info.value = await Apis.user.queryUserInfo();
      info.refresh();
      if (updateBalance == true) {
        refreshBalance();
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future refreshBalance() async {
    if (stores.auth.unauthorized || refreshing) return;
    refreshing = true;
    final r = await Future.wait([Apis.user.queryBalance(), Future.delayed(const Duration(seconds: 1))]).whenComplete(() {
      refreshing = false;
    });
    balance.value = r[0].balance;
  }

  Future initialize() async {}
}
