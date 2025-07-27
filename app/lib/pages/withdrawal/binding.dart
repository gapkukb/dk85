part of 'index.dart';

class WithdrawalBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<WithdrawalController>(
        () => WithdrawalController(),
      )
    ];
  }
}
