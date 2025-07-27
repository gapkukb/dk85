part of 'index.dart';

class SlotsBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<SlotsController>(
        () => SlotsController(),
      )
    ];
  }
}
