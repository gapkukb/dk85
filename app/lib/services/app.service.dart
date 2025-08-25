part of 'index.dart';

class AppService extends GetxService {
  static AppService get to => Get.find();

  @override
  void onInit() {
    AppLifecycleListener(
      onShow: _onAppShow,
      // onHide: _onAppShow,
      // onDetach: _onAppShow,
      // binding: _onAppShow,
      // onRestart: _onAppShow,
      // onPause: _onAppShow,
      // onResume: _onAppShow,
      // onExitRequested: _onAppShow,
      // onInactive: _onAppShow,
      onStateChange: _onAppStateChange,
    );
    super.onInit();
  }

  void _onAppShow() {}

  void _onAppStateChange(AppLifecycleState state) {
    debugPrint('AppStateChange$state');
  }
}
