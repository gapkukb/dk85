part of 'index.dart';

class _UserService extends GetxService {
  final balance = RxNum(0);
  final userInfo = Rxn<UserModel>();

  Future queryUserInfo([bool? withBalance]) async {
    try {
      final r = await apis.user.queryUserInfo();
      userInfo.value = r.data;
      userInfo.refresh();
      if (withBalance == true) {
        queryBalance();
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future queryBalance() async {
    final a = await Future.wait([apis.user.queryBalance(), Future.delayed(Duration(seconds: 1))]);
    final b = a.first as BalanceModelWrapper;
    balance.value = b.data.balance;
    balance.refresh();
  }
}
