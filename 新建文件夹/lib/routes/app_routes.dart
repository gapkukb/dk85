part of 'app_pages.dart';

abstract class Routes {
  static const demo = _Paths.dashboard + _Paths.demo;
  static const spalash = _Paths.spalash;
  static const auth = _Paths.auth;
  static const country = _Paths.country;
  static const details = _Paths.details;

  // 主视图
  static const dashboard = _Paths.dashboard;

  //首页
  static const home = dashboard + _Paths.home;
  static const foru = home + _Paths.foru;
  static const slots = home + _Paths.slots;
  static const fishing = home + _Paths.fishing;
  static const poker = home + _Paths.poker;
  static const casino = home + _Paths.casino;
  //
  static const promos = dashboard + _Paths.promos;
  static const funds = dashboard + _Paths.funds;
  static const me = dashboard + _Paths.me;
  //
  static const customerService = _Paths.customerService;
  static const deposit = _Paths.deposit;
  static const withdrawal = _Paths.withdrawal;
  static const receiption = _Paths.receipt;
  static const more = _Paths.more;
  static const favorites = _Paths.favorites;
  static const inbox = _Paths.inbox;
  static const settings = _Paths.settings;
  static const updatePasswrod = _Paths.updatePasswrod;
  static const compeleteProfile = _Paths.compeleteProfile;
  static const announcement = _Paths.announcement;
  static const confirmation = _Paths.confirmation;
  static const withdrawalAccount = _Paths.withdrawalAccount;
  static const records = _Paths.records;
  static const recordsFunds = _Paths.recordsFunds;
  static const recordsFundsDetail = _Paths.recordsFundsDetail;
  static const recordsGames = _Paths.recordsGames;
  static const recordsDeposit = _Paths.recordsDeposit;
  static const recordsWithdrawal = _Paths.recordsWithdrawal;
  static const search = _Paths.search;

  // 登陆后重定向到参数
  static String loginThen(String to) {
    return '$auth?then=${Uri.encodeQueryComponent(to)}';
  }
}

abstract class _Paths {
  static const home = '/home';
  static const settings = '/settings';
  static const auth = '/auth';
  static const dashboard = '/dashboard';
  static const spalash = '/spalash';
  static const country = '/country';
  static const details = '/details';
  static const foru = '/foru';
  static const promos = '/promos';
  static const funds = '/funds';
  static const me = '/me';
  static const fishing = '/fishing';
  static const slots = '/slots';
  static const poker = '/poker';
  static const casino = '/casino';
  static const customerService = '/customer-service';
  static const deposit = '/deposit';
  static const withdrawal = '/withdrawal';
  static const receipt = '/receipt';
  static const more = '/more';
  static const favorites = '/favorites';
  static const inbox = '/inbox';
  static const updatePasswrod = '/update-password';
  static const compeleteProfile = '/compelete-profile';
  static const announcement = '/announcement';
  static const confirmation = '/confirmation';
  static const withdrawalAccount = '/withdrawal-account';
  static const records = '/records';
  static const recordsFunds = '/funds';
  static const recordsFundsDetail = '/funds-detail';
  static const recordsGames = '/games';
  static const recordsDeposit = '/deposit';
  static const recordsWithdrawal = '/withdrawal';
  static const search = '/search';
  static const demo = '/demo';
}
