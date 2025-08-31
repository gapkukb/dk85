part of 'index.dart';

Widget createHomeIcon(String assetPath) {
  return Transform.scale(
    alignment: Alignment(0, -0.6),
    scale: 2.5,
    child: ClipRRect(
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.circular(2),
      child: Image.asset(assetPath, width: 16, height: 16),
    ),
  );
}

class _Tab extends BottomNavigationBarItem {
  final bool protected;
  _Tab({
    super.key,
    super.activeIcon,
    super.backgroundColor,
    super.label,
    super.tooltip,
    required super.icon,
    this.protected = false,
  });
}

mixin class MainService {
  static FundsController get funds => Get.find<FundsController>();

  final currentIndex = 0.obs;
  final List<_Tab> tabs = [
    _Tab(
      icon: createHomeIcon("assets/icons/logo.webp"),
      activeIcon: createHomeIcon("assets/icons/logo-2.webp"),
      label: '',
    ),
    _Tab(icon: Icon(IconFont.gift_fill), label: 'Bonus', key: guide.guideTwo),
    _Tab(icon: Icon(IconFont.wallet), label: 'Wallet', protected: true),
    _Tab(icon: Icon(IconFont.profile), label: 'Account', protected: true),
  ];

  /// 跳转页面
  toView(int index) {
    print('toview:${tabs[index].protected}');
    if (tabs[index].protected && AuthService.to.ensureUnauthorize) return;
    currentIndex.value = index;
  }

  /// 跳转首页
  toHomeView() {
    toView(0);
  }

  /// 跳转优惠页
  toPromosView() {
    toView(1);
  }

  /// 跳转钱包
  toFundsView([int? index]) {
    toView(2);
    funds.tab.animateTo(index ?? 0);
  }

  /// 跳转个人中心
  toMeView() {
    toView(3);
  }
}
