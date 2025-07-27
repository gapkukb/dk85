part of 'index.dart';

class ForuBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<ForuController>(
        () => ForuController(),
      )
    ];
  }
}
