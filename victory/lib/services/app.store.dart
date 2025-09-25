part of 'services.dart';

class _AppService extends GetxService with VicRouterMixin, VicLocaleMixin, AudioMixin {
  Future ensureInitialized() async {
    initLocale();
  }
}
