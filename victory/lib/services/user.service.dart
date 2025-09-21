part of 'services.dart';

class _UserService extends GetxService {
  final balance = RxNum(0);
  Future refreshBalance() async {
    // if (services.auth.unauthorized) return;
    await Future.delayed(const Duration(seconds: 3));
    balance.value = math.Random().nextInt(1000000);
  }

  Future initialize() async {}
}
