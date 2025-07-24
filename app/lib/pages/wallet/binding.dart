part of 'index.dart';

class WalletBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<WalletController>(
        () => WalletController(),
      )
    ];
  }
}
