import 'package:app/shared/customer_service/customer_service.dart';
import 'package:app/views/auth/auth_view.dart';
import 'package:app/views/funds_recharge_detail/funds_recharge_detail_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const INITIAL = Routes.receiption;

  static final routes = [
    GetPage(name: Routes.auth, page: () => const AuthView()),
    GetPage(
      name: Routes.customerService,
      page: () => const CustomerServiceView(),
    ),
    GetPage(
      name: Routes.receiption,
      page: () => const FundsRechargeDetailView(),
    ),
  ];
}
