part of 'index.dart';

class TabsService extends GetxService {
  static TabsService get to => Get.find();
  static FundsController get funds => Get.find<FundsController>();

  final currentIndex = 0.obs;
  final tabs = [
    BottomNavigationBarItem(
      icon: Transform.scale(
        alignment: Alignment(0, -0.6),
        scale: 2.5,
        child: Image.asset("assets/icons/logo.webp", width: 16, height: 16),
      ),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(IconFont.gift_fill),
      label: 'Bonus',
      key: guide.guideTwo,
    ),
    BottomNavigationBarItem(icon: Icon(IconFont.wallet), label: 'Wallet'),
    BottomNavigationBarItem(icon: Icon(IconFont.profile), label: 'Account'),
  ];

  /// 跳转页面
  toView(int index) {
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
