part of 'index.dart';

abstract class Storage {
  static final locale = _StoreageItem<String>(_global, "locale", I18n.defaultLocale.code);
  static final music = _StoreageItem<bool>(_global, "music", true);
}
