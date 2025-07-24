part of './index.dart';

abstract class Routes {
  static const home = _Paths.home;

  static const promos = _Paths.home + _Paths.promos;
  static const wallet = _Paths.home + _Paths.wallet;
  static const profile = _Paths.home + _Paths.profile;
  static const settings = _Paths.settings;

  static const products = _Paths.home + _Paths.products;

  static const login = _Paths.login;
  static const dashboard = _Paths.home + _Paths.dashboard;
  Routes._();
  static String LOGIN_THEN(String afterSuccessfulLogin) =>
      '$login?then=${Uri.encodeQueryComponent(afterSuccessfulLogin)}';
  static String PRODUCT_DETAILS(String productId) => '$products/$productId';
}

abstract class _Paths {
  static const home = '/home';
  static const products = '/products';
  static const promos = '/promos';
  static const wallet = '/wallet';
  static const profile = '/profile';
  static const settings = '/settings';
  static const productDetails = '/:productId';
  static const login = '/login';
  static const dashboard = '/dashboard';
}
