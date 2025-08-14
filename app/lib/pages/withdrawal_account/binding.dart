part of 'index.dart';

class WithdrawalAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WithdrawalAccountController());
  }
}
