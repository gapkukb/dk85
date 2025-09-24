import 'package:get/get.dart';
import '../env.dart';
import '../pages/account/account.dart';
import '../pages/activity/activity.dart';
import '../pages/auth/auth_view.dart';
import '../pages/customer_service/customer_service.dart';
import '../pages/debug/settings.dart';
import '../pages/email_mng/email_mng.dart';
import '../pages/favorites/index.dart';
import '../pages/favorites/view.dart';
import '../pages/fund_account/fund_account.dart';
import '../pages/gaming/gaming.dart';
import '../pages/history_detail/history_detail.dart';
import '../pages/history_funds/view.dart';
import '../pages/history_page_1/history_page_1.dart';
import '../pages/history_page_2/history_page_2.dart';
import '../pages/inbox/index.dart';
import '../pages/inbox/view.dart';
import '../pages/inbox_detail/view.dart';
import '../pages/mobile_mng/mobile_mng.dart';
import '../pages/more/more.dart';
import '../pages/payee/payee.dart';
import '../pages/pwd_mng/pwd_mng.dart';
import '../pages/rebate/view.dart';
import '../pages/search/bindings.dart';
import '../pages/search/view.dart';
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
    GetPage(name: AppRoutes.more, page: () => const VicMorePage()),
    GetPage(name: AppRoutes.gaming, page: () => const VicGamingPage()),
    GetPage(name: AppRoutes.activity, page: () => const VicActivityPage()),
    GetPage(name: AppRoutes.customerService, page: () => const VicCustomerServiceView()),
    GetPage(name: AppRoutes.account, page: () => const VicAccountPage()),
    GetPage(name: AppRoutes.payee, page: () => const VicPayeePage()),
    GetPage(name: AppRoutes.pwd, page: () => const VicPwdMngPage()),
    GetPage(name: AppRoutes.mobile, page: () => const VicMobileMngPage()),
    GetPage(name: AppRoutes.mobile, page: () => const VicEmailMngPage()),
    GetPage(name: AppRoutes.rebate, page: () => const VicRebatePage()),
    GetPage(name: AppRoutes.vip, page: () => const VicVipPage()),
    GetPage(name: AppRoutes.vipDetail, page: () => const VicVipDetailsPage()),
    GetPage(name: AppRoutes.favorites, page: () => const VicFavPage(), binding: VicFavBinding()),
    GetPage(name: AppRoutes.inbox, page: () => const VicInboxPage(), binding: VicInboxBinding()),
    GetPage(name: AppRoutes.inboxDetail, page: () => const VicInboxDetailsPage()),
    GetPage(name: AppRoutes.fundAccount, page: () => const VicFundAccountPage()),
    GetPage(name: AppRoutes.history1, page: () => const VicTransHistoryPage()),
    GetPage(name: AppRoutes.history2, page: () => const VicHistoryList2Page()),
    GetPage(name: AppRoutes.historyDepositDetails, page: () => const VicFundHistoryDetailPage(1)),
    GetPage(name: AppRoutes.historyWithdrawalDetials, page: () => const VicFundHistoryDetailPage(2)),
    GetPage(name: AppRoutes.search, page: () => const VicSearchPage(), binding: VicSearchBinding()),
  ];
}
