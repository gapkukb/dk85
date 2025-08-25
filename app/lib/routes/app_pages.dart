import 'package:app/shared/customer_service/customer_service.dart';
import 'package:app/views/auth/auth_view.dart';
import 'package:app/views/email/email.dart';
import 'package:app/views/favorites/bindings.dart';
import 'package:app/views/favorites/view.dart';
import 'package:app/views/funds_mng/index.dart';
import 'package:app/views/gaming/gaming.dart';
import 'package:app/views/history_page_1/history_page_1.dart';
import 'package:app/views/history_page_2/history_page_2.dart';
import 'package:app/views/inbox/index.dart';
import 'package:app/views/inbox_detail/bindings.dart';
import 'package:app/views/mobile/mobile.dart';
import 'package:app/views/more/more_view.dart';
import 'package:app/views/payee/payee.dart';
import 'package:app/views/profile/profile_view.dart';
import 'package:app/views/pwd_manager/pwd_manager.dart';
import 'package:app/views/searching/bindings.dart';
import 'package:app/views/searching/view.dart';
import 'package:app/views/vip/detail_view.dart';
import 'package:app/views/vip/view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const INITIAL = Routes.history1;
  // static const INITIAL = null;

  static final routes = [
    GetPage(name: Routes.auth, page: () => const AuthView()),
    GetPage(
      name: Routes.customerService,
      page: () => const CustomerServiceView(),
    ),
    GetPage(name: Routes.receiption, page: () => const PayeeView()),
    GetPage(name: Routes.profile, page: () => const ProfileView()),
    GetPage(name: Routes.mobile, page: () => const MobileView()),
    GetPage(name: Routes.email, page: () => const EmailView()),
    GetPage(name: Routes.pwd, page: () => const PwdManagerView()),
    GetPage(name: Routes.more, page: () => const MoreView()),
    GetPage(
      name: Routes.favorites,
      page: () => const FavoritesView(),
      binding: FavoritesBinding(),
    ),
    GetPage(
      name: Routes.inboxDetail,
      page: () => const InboxView(),
      binding: InboxDetailBinding(),
    ),
    GetPage(
      name: Routes.inbox,
      page: () => const InboxView(),
      binding: InboxBinding(),
    ),
    GetPage(name: Routes.gaming, page: () => const GamingView()),
    GetPage(
      name: Routes.fundsManager,
      page: () => const FundsMngView(),
      binding: FundsMngBinding(),
    ),
    GetPage(name: Routes.vip, page: () => const VipView()),
    GetPage(name: Routes.vipDetail, page: () => const VipDetailView()),
    GetPage(name: Routes.history1, page: () => const HistoryPage1View()),
    GetPage(name: Routes.history2, page: () => const HistoryPage2View()),
    GetPage(
      name: Routes.search,
      page: () => const SearchingPage(),
      binding: SearchingBinding(),
    ),
  ];
}
