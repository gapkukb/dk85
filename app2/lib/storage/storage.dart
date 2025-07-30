part of 'index.dart';

abstract class Storage {
  static final music = _StoreageItem<bool>(_global, "music", true);
}
