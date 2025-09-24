import 'package:get/get.dart';
import '../env.dart';
import '../pages/account/account.dart';
import '../pages/auth/auth_view.dart';
import '../pages/customer_service/customer_service.dart';
import '../pages/debug/settings.dart';
import '../pages/email_mng/email_mng.dart';
import '../pages/mobile_mng/mobile_mng.dart';
import '../pages/payee/payee.dart';
import '../pages/pwd_mng/pwd_mng.dart';
import '../pages/rebate/view.dart';
import '../pages/shell/shell.dart';
import '../pages/vip/detail_view.dart';
import '../pages/vip/view.dart';
import '/pages/demo/demo.dart';
part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const INITIAL = Environment.isDev ? null : null;
  // static const INITIAL = Environment.isDev ? AppRoutes.debug : null;
  static final List<GetPage> routes = [
    // GetPage(name: '/', page: () => const ShellView(), preventDuplicates: true, popGesture: false, participatesInRootNavigator: true),
    if (Environment.isNotProd) GetPage(name: AppRoutes.demo, page: () => const DemoPage()),
    GetPage(name: AppRoutes.debug, page: () => const DebugSettings()),
    GetPage(name: AppRoutes.auth, page: () => const VicAuthPage()),
    GetPage(name: AppRoutes.customerService, page: () => const VicCustomerServiceView()),
    GetPage(name: AppRoutes.account, page: () => const VicAccountPage()),
    GetPage(name: AppRoutes.payee, page: () => const VicPayeePage()),
    GetPage(name: AppRoutes.pwd, page: () => const VicPwdMngPage()),
    GetPage(name: AppRoutes.mobile, page: () => const VicMobileMngPage()),
    GetPage(name: AppRoutes.mobile, page: () => const VicEmailMngPage()),
    GetPage(name: AppRoutes.rebate, page: () => const VicRebatePage()),
    GetPage(name: AppRoutes.vip, page: () => const VicVipPage()),
    GetPage(name: AppRoutes.vipDetail, page: () => const VicVipDetailsPage()),
  ];
}
