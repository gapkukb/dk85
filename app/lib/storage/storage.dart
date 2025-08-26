part of 'index.dart';

class _Storage {
  Future setup() {
    return Future.wait([
      _global.initStorage,
      _game.initStorage,
      _user.initStorage,
    ]);
  }

  final locale = _StoreageItem<String>(
    _global,
    "locale",
    I18n.defaultLocale.code,
  );
  final music = _StoreageItem<bool>(_global, "music", true);
  final token = _StoreageItem<String>(_global, "token", '');
  final user = _StoreageItem<Object>(_user, "user", '');
  final allGame = _StoreageItem<Object>(_user, "all-game", '');
  final showGuide = _StoreageItem<bool>(_user, "show-guide", true);
}

final storage = _Storage();
