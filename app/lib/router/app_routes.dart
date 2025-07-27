part of './index.dart';

abstract class Routes {
  Routes._();
  static const home = _Paths.home;
  static const promos = _Paths.home + _Paths.promos;
  static const wallet = _Paths.home + _Paths.wallet;
  static const profile = _Paths.home + _Paths.profile;
  // static const products = _Paths.home + _Paths.products;
  static const dashboard = _Paths.home + _Paths.dashboard;

  static const settings = _Paths.settings;
  static const login = _Paths.login;
  static const account = _Paths.account;
  static const funds = _Paths.funds;
  static const customerService = _Paths.customerService;
  static const playing = _Paths.playing;
  static const completeProfile = _Paths.completeProfile;
  static const userAccount = _Paths.userAccount;
  // static const deposit = _Paths.home + _Paths.wallet + _Paths.deposit;
  // static const withdrawal = _Paths.home + _Paths.wallet + _Paths.withdrawal;

  // static String LOGIN_THEN(String afterSuccessfulLogin) =>
  //     '$login?then=${Uri.encodeQueryComponent(afterSuccessfulLogin)}';
  // static String PRODUCT_DETAILS(String productId) => '$products/$productId';
}

abstract class _Paths {
  static const home = '/home';
  static const products = '/products';
  static const promos = '/promos';
  static const wallet = '/wallet/:type';
  static const profile = '/profile';
  static const settings = '/settings';
  static const productDetails = '/:productId';
  static const login = '/login';
  static const dashboard = '/dashboard';
  static const account = '/account';
  static const deposit = '/deposit';
  static const withdrawal = '/withdrawal';
  static const funds = '/funds';
  static const customerService = '/customer-service';
  static const playing = '/playing';
  static const completeProfile = '/complete_profile';
  static const userAccount = '/user_account';
}
