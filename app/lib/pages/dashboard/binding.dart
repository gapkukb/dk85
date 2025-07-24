part of 'index.dart';

class DashboardBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<DashboardController>(
        () => DashboardController(),
      )
    ];
  }
}
