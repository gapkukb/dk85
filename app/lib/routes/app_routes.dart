part of 'app_pages.dart';

abstract class Routes {
  static const demo = '/demo';
  static const spalash = '/spalash';
  static const auth = '/auth';
  static const customerService = '/customerService';
  static const receiption = '/receiption';
  static const more = '/more';
  static const favorites = '/favorites';
  static const inbox = '/inbox';
  static const inboxDetail = '/inboxDetail';
  static const history1 = '/historyFunds';
  static const history2 = '/historyWallet';
  static const historyDetial = '/historyDetial';
  static const search = '/search';
  static const profile = '/profile';
  static const vip = '/vip';
  static const vipDetail = '/vipDetail';
  static const mobile = '/mobile';
  static const email = '/email';
  static const pwd = '/pwd';
  static const gaming = '/gaming';
  static const fundsManager = '/fundsManager';
  static const activityDetail = '/activityDetail';

  // 登陆后重定向到参数
  static String loginThen(String to) {
    return '$auth?then=${Uri.encodeQueryComponent(to)}';
  }
}
