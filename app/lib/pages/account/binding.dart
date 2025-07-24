part of 'index.dart';

class AccountBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<AccountController>(
        () => AccountController(),
      )
    ];
  }
}
