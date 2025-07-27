part of 'index.dart';

class PlayingBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<PlayingController>(
        () => PlayingController(),
      )
    ];
  }
}
