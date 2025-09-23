import 'package:get/get.dart';
import '../env.dart';
import '../pages/auth/auth_view.dart';
import '../pages/customer_service/customer_service.dart';
import '../pages/shell/shell.dart';
import '/pages/demo/demo.dart';
part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  // static const INITIAL = Environment.isDev ? null : null;
  static const INITIAL = Environment.isDev ? AppRoutes.auth : null;
  static final List<GetPage> routes = [
    // GetPage(name: '/', page: () => const ShellView(), preventDuplicates: true, popGesture: false, participatesInRootNavigator: true),
    GetPage(name: AppRoutes.demo, page: () => const DemoPage()),
    GetPage(name: AppRoutes.auth, page: () => const VicAuthPage()),
    GetPage(name: AppRoutes.customerService, page: () => const VicCustomerServiceView()),
  ];
}
