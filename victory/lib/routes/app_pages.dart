import 'package:get/get.dart';
import 'package:victory/env.dart';
import 'package:victory/pages/account/account.dart';
import 'package:victory/pages/activity/activity.dart';
import 'package:victory/pages/auth/auth_view.dart';
import 'package:victory/pages/customer_service/customer_service.dart';
import 'package:victory/pages/debug/settings.dart';
import 'package:victory/pages/email_mng/email_mng.dart';
import 'package:victory/pages/favorites/index.dart';
import 'package:victory/pages/fund_account/fund_account.dart';
import 'package:victory/pages/gaming/gaming.dart';
import 'package:victory/pages/history_detail/history_detail.dart';
import 'package:victory/pages/history_page_1/history_page_1.dart';
import 'package:victory/pages/history_page_2/history_page_2.dart';
import 'package:victory/pages/inbox/index.dart';
import 'package:victory/pages/inbox_detail/view.dart';
import 'package:victory/pages/mobile_mng/mobile_mng.dart';
import 'package:victory/pages/more/more.dart';
import 'package:victory/pages/payee/payee.dart';
import 'package:victory/pages/pwd_mng/pwd_mng.dart';
import 'package:victory/pages/rebate/view.dart';
import 'package:victory/pages/search/bindings.dart';
import 'package:victory/pages/search/view.dart';
import 'package:victory/pages/vip/detail_view.dart';
import 'package:victory/pages/vip/view.dart';
import 'package:victory/pages/demo/demo.dart';
part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  // static const INITIAL = Environment.isDev ? null : null;
  static const INITIAL = Environment.isDev ? AppRoutes.demo : null;
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
    GetPage(name: AppRoutes.email, page: () => const VicEmailMngPage()),
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
