part of 'stores.dart';

class _AppService extends GetxService with VicRouterMixin, VicLocaleMixin, AudioMixin {
  Future initialize() async {
    initLocale();
  }
}
