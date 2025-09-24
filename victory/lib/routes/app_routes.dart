part of 'app_pages.dart';

abstract class AppRoutes {
  static const demo = '/demo';
  static const spalash = '/spalash';
  static const auth = '/auth';
  static const customerService = '/customerService';
  static const payee = '/payee';
  static const more = '/more';
  static const favorites = '/favorites';
  static const inbox = '/inbox';
  static const inboxDetail = '/inboxDetail';
  static const history1 = '/historyFunds';
  static const history2 = '/historyWallet';
  static const historyDepositDetails = '/historyRechargeDetial';
  static const search = '/search';
  static const account = '/profile';
  static const vip = '/vip';
  static const vipDetail = '/vipDetail';
  static const mobile = '/mobile';
  static const email = '/email';
  static const pwd = '/pwd';
  static const gaming = '/gaming';
  static const fundAccount = '/fundsManager';
  static const activity = '/activityDetail';
  static const rebate = '/rebate';
  static const historyWithdrawalDetials = '/historyWithdrawalDetial';
  static const debug = '/debug';

  // 登陆后重定向到参数
  static String loginThen(String to) {
    return '$auth?then=${Uri.encodeQueryComponent(to)}';
  }
}
