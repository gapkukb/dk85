part of 'services.dart';

class _AppService extends GetxService with VicRouterMixin, VicLocaleMixin, AudioMixin {
  Future ensureInitialized() async {
    initLocale();
  }

  queryAnnouncements() async {
    final r = await apis.app.queryAnnouncements();
    if (r.isNotEmpty) {
      VicModals.shared.show(VicModalName.announcement);
    }
  }
}
