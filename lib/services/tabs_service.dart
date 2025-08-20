part of 'index.dart';

class TabsService extends GetxService {
  static TabsService get to => Get.find();

  final currentIndex = 0.obs;
  final pages = [
    BottomNavigationBarItem(
      icon: Icon(Icons.access_alarms_sharp),
      label: 'abc',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.access_alarms_sharp),
      label: 'abc',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.access_alarms_sharp),
      label: 'abc',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.access_alarms_sharp),
      label: 'abc',
    ),
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
  toFundsView() {
    toView(2);
  }

  /// 跳转个人中心
  toMeView() {
    toView(3);
  }

  @override
  void onInit() {
    print("onInit");
    super.onInit();
  }
}
