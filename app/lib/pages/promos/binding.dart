part of 'index.dart';

class PromosBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<PromosController>(
        () => PromosController(),
      )
    ];
  }
}
