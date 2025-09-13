part of 'index.dart';

class _UserService extends GetxService {
  final balance = RxNum(0);
  final userInfo = Rxn<UserModel>();

  Future queryUserInfo({bool withBalance = false, bool initial = false}) async {
    try {
      final r = await apis.user.queryUserInfo();
      userInfo.value = r.data;
      userInfo.refresh();
      if (withBalance == true) {
        queryBalance();
      }
      // if (initial) {
      //   Future.delayed(Duration(seconds: 2)).then((_) {
      //     print('custom3');
      //     queryActivity();
      //   });
      // }
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

  queryActivity() {
    final info = userInfo.value;
    if (info == null) return;
    if (info.payTimes == 0) {
      Dialogs.to.show(DialogNames.topUpBouns);
    }
    if (info.mobile.isEmpty == true) {
      Dialogs.to.show(DialogNames.completion);
    }
    if (info.isSignIn == false) {
      Dialogs.to.show(DialogNames.dailyCheckIn);
    }
  }
}
