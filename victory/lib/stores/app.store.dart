part of 'stores.dart';

class _AppService extends GetxService with VicRouterMixin, VicLocaleMixin, AudioMixin {
  Future ensureInitialized() async {
    initLocale();
  }
}
