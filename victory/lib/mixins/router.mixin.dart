import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:victory/helper/native_image.dart';
import 'package:victory/routes/app_pages.dart';
import 'package:victory/services/services.dart';
import 'package:victory/iconfont/iconfont.dart';
import 'package:victory/startup/guide/guide.dart';

final _homeIcon = Transform.scale(
  alignment: const Alignment(0, -0.6),
  scale: 2.5,
  child: ClipRRect(
    clipBehavior: Clip.hardEdge,
    borderRadius: BorderRadius.circular(2),
    child: Image.file(File(NativeImage.logo), width: 16, height: 16),
  ),
);

mixin VicRouterMixin {
  final currentRoute = '/'.obs;
  final currentFootNavIndex = 0.obs;
  final List<_FootNavItem> footNavItems = [
    _FootNavItem(
      icon: Opacity(opacity: 0.85, child: _homeIcon),
      activeIcon: _homeIcon,
      label: '',
      routingName: '/',
    ),
    _FootNavItem(icon: const Icon(IconFont.gift_fill), label: 'Bonus', routingName: AppRoutes.bonus, key: guideStepTwoKey),
    _FootNavItem(icon: const Icon(IconFont.wallet), label: 'Wallet', protected: true, routingName: AppRoutes.fund),
    _FootNavItem(icon: const Icon(IconFont.profile), label: 'Account', protected: true, routingName: AppRoutes.profile),
  ];

  void navigateTo(int index) {
    while (Get.currentRoute != '/') {
      Get.back(closeOverlays: true);
    }
    if (index == currentFootNavIndex.value) return;
    final current = footNavItems[index];
    if (current.protected && services.auth.unauthorized) {
      services.auth.toAuth();
    } else {
      currentFootNavIndex.value = index;
      onRouting(Routing(current: current.routingName));
    }
  }

  void toHomePage() {
    navigateTo(0);
  }

  void toBonusPage() {
    navigateTo(1);
  }

  void toFundsPage([int? type]) {
    navigateTo(2);
  }

  void toProfilePage() {
    navigateTo(3);
  }

  void onRouting(Routing? routing) {
    if (routing?.current == '/') {
      if (footNavItems.firstWhereOrNull((i) => i.routingName == currentRoute.value) == null) {
        currentRoute.value = '/';
      } else {
        currentRoute.value = routing?.current ?? '/';
      }
    } else {
      currentRoute.value = routing?.current ?? '/';
    }
  }

  Worker listenRouting(Function(String current) listener) {
    return ever(currentRoute, (_) => listener(currentRoute.value));
  }
}

class _FootNavItem extends BottomNavigationBarItem {
  final bool protected;
  final String routingName;
  _FootNavItem({super.key, required this.routingName, super.activeIcon, super.label, required super.icon, this.protected = false});
}
