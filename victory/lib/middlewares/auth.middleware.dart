import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:victory/routes/app_pages.dart';
import 'package:victory/shared/logger/logger.dart';
import 'package:victory/services/services.dart';

class EnsureAuthMiddleware extends GetMiddleware {
  EnsureAuthMiddleware({int priority = 1}) : super(priority: priority);

  @override
  RouteSettings? redirect(String? route) {
    Logger.debug('auth middleware route:$route');
    if (services.auth.unauthorized) {
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
    if (services.auth.authorized) {
      return null;
    }
    return super.redirect(route);
  }
}
