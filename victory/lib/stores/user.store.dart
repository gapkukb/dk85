part of 'stores.dart';

class _UserService extends GetxService {
  final balance = RxNum(0);
  final info = UserModel.fromJson({}).obs;

  Future queryUserInfo({bool updateBalance = false, bool initial = false}) async {
    try {
      info.value = await Apis.user.queryUserInfo();
      info.refresh();
      if (updateBalance == true) {
        refreshBalance();
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

  Future refreshBalance() async {
    // if (services.auth.unauthorized) return;
    await Future.delayed(const Duration(seconds: 3));
    balance.value = math.Random().nextInt(1000000);
  }

  Future initialize() async {}
}
