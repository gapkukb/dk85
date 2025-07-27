part of 'index.dart';

class FundsBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<FundsController>(
        () => FundsController(),
      )
    ];
  }
}
