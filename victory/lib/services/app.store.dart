part of 'services.dart';

class _AppService extends GetxService with VicRouterMixin, VicLocaleMixin, AudioMixin {
  Future ensureInitialized() async {
    initLocale();
  }

  @override
  onReady() {
    initializeAudio();
    queryAnnouncements();
  }

  queryAnnouncements() async {
    final r = await apis.app.queryAnnouncements();
    if (r != null && r.isNotEmpty) {
      VicModals.shared.show(VicModalName.announcement);
    }
  }
}
