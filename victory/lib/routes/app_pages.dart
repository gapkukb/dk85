import 'package:get/get.dart';
import '../pages/shell/shell.dart';
import '/pages/demo/demo.dart';

part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  // static const INITIAL = Routes.favorites;
  static const INITIAL = null;

  static final List<GetPage> routes = [
    // GetPage(name: '/', page: () => const ShellView(), preventDuplicates: true, popGesture: false, participatesInRootNavigator: true),
    GetPage(name: AppRoutes.demo, page: () => const DemoPage()),
  ];
}
