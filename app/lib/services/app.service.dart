part of 'index.dart';

class _AppService extends GetxService with HomeViewMixin, AudioMixin {
  static _AppService get to => Get.find();
  final announcements = <AnnouncementModel>[].obs;
  void queryAnnouncements() async {
    final r = await apis.app.queryAnnouncements();
    announcements.value = r.data;
    if (r.data.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Dialogs.to.show(DialogNames.announcement);
      });
    }
  }

  @override
  void onInit() {
    AppLifecycleListener(
      onShow: _onAppShow,
      onHide: _onAppHide,
      // onDetach: _onAppShow,
      // binding: _onAppShow,
      // onRestart: _onAppShow,
      // onPause: _onAppShow,
      // onResume: _onAppShow,
      // onExitRequested: _onAppShow,
      // onInactive: _onAppShow,
      onStateChange: _onAppStateChange,
    );
    initializeAudio();
    super.onInit();
  }

  @override
  void onReady() {
    queryAnnouncements();
    super.onReady();
  }

  void _onAppStateChange(AppLifecycleState state) {
    debugPrint('AppStateChange$state');
  }

  void _onAppShow() {
    resumeAudio();
  }

  void _onAppHide() {
    pauseAudio();
  }
}
