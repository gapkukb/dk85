part of 'index.dart';

class WebviewBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<WebviewController>(
        () => WebviewController(),
      )
    ];
  }
}
