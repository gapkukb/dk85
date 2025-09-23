import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/app_pages.dart';
import '../shared/logger/logger.dart';
import '../stores/stores.dart';

class EnsureAuthMiddleware extends GetMiddleware {
  EnsureAuthMiddleware({int priority = 1}) : super(priority: priority);

  @override
  RouteSettings? redirect(String? route) {
    Logger.debug('auth middleware route:$route');
    if (stores.auth.unauthorized) {
      return const RouteSettings(name: AppRoutes.auth);
    }
    return null;
  }
}

class EnsureNotAuthedMiddleware extends GetMiddleware {
  EnsureNotAuthedMiddleware({int priority = 1}) : super(priority: priority);

  @override
  RouteSettings? redirect(String? route) {
    Logger.debug('auth middleware route:$route');
    if (stores.auth.authorized) {
      return null;
    }
    return super.redirect(route);
  }
}
