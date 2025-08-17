import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRouteObserver extends GetObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    print('Route pushed: ${route.settings.name}');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    print('Route popped: ${route.settings.name}');
  }

  @override
  void didChangeTop(Route topRoute, Route? previousTopRoute) {
    print('Route popped: ${topRoute.settings.name}');
    super.didChangeTop(topRoute, previousTopRoute);
  }
}
