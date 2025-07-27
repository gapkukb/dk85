part of 'index.dart';

class DepositBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<DepositController>(
        () => DepositController(),
      )
    ];
  }
}
