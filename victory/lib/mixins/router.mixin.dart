import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:victory/services/services.dart';
import 'package:victory/iconfont/iconfont.dart';

mixin VicRouterMixin {
  final currentFootNavIndex = 0.obs;
  final List<_FootNavItem> footNavItems = [
    _FootNavItem(icon: _NavIcon("assets/icons/logo.webp"), activeIcon: _NavIcon("assets/icons/logo-2.webp"), label: ''),
    _FootNavItem(icon: const Icon(IconFont.gift_fill), label: 'Bonus'),
    _FootNavItem(icon: const Icon(IconFont.wallet), label: 'Wallet', protected: true),
    _FootNavItem(icon: const Icon(IconFont.profile), label: 'Account', protected: true),
  ];

  void navigateTo(int index) {
    while (Get.currentRoute != '/') {
      Get.back();
    }
    if (index == currentFootNavIndex) return;
    if (footNavItems[index].protected && services.auth.unauthorized) {
      services.auth.toAuth();
    } else {
      currentFootNavIndex.value = index;
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
  _FootNavItem({super.activeIcon, super.label, required super.icon, this.protected = false});
}
