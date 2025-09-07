part of 'index.dart';

class _UserService extends GetxService {
  final balance = RxNum(0);
  final userInfo = Rxn<UserModel>();

  Future queryUserInfo() async {
    final r = await apis.user.queryUserInfo();
    userInfo.value = r.data;
    userInfo.refresh();
  }

  Future queryBalance() async {
    final a = await Future.wait([apis.user.queryBalance(), Future.delayed(Duration(seconds: 1))]);
    final b = a.first as BalanceModelWrapper;
    balance.value = b.data.balance;
    balance.refresh();
  }
}
