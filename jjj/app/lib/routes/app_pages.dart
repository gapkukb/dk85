import 'package:app/views/login/login_view.dart';
import 'package:get/get.dart';
import 'middlewares/ensure_auth_middleware.dart';

part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const INITIAL = Routes.auth;

  static final routes = [
    GetPage(name: Routes.auth, page: () => const LoginView()),
  ];
}
