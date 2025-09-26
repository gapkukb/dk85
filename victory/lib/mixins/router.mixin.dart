import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:victory/routes/app_pages.dart';
import 'package:victory/services/services.dart';
import 'package:victory/iconfont/iconfont.dart';
import 'package:victory/startup/guide/guide.dart';

mixin VicRouterMixin {
  final currentRoute = '/'.obs;
  final currentFootNavIndex = 0.obs;
  final List<_FootNavItem> footNavItems = [
    _FootNavItem(icon: _NavIcon("assets/icons/logo.webp"), activeIcon: _NavIcon("assets/icons/logo-2.webp"), label: '', routingName: '/'),
    _FootNavItem(icon: const Icon(IconFont.gift_fill), label: 'Bonus', routingName: AppRoutes.bonus, key: guideStepTwoKey),
    _FootNavItem(icon: const Icon(IconFont.wallet), label: 'Wallet', protected: true, routingName: AppRoutes.fund),
    _FootNavItem(icon: const Icon(IconFont.profile), label: 'Account', protected: true, routingName: AppRoutes.profile),
  ];

  void navigateTo(int index) {
    while (Get.currentRoute != '/') {
      Get.back();
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

Widget _NavIcon(String assetPath) {
  return Transform.scale(
    alignment: const Alignment(0, -0.6),
    scale: 2.5,
    child: ClipRRect(clipBehavior: Clip.hardEdge, borderRadius: BorderRadius.circular(2), child: Image.asset(assetPath, width: 16, height: 16)),
  );
}

class _FootNavItem extends BottomNavigationBarItem {
  final bool protected;
  final String routingName;
  _FootNavItem({super.key, required this.routingName, super.activeIcon, super.label, required super.icon, this.protected = false});
}
