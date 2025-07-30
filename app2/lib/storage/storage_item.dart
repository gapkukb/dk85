part of 'index.dart';

const _globalName = 'get_global';
const _gameName = 'get_game';
const _userName = 'get_user';

final _global = GetStorage(_globalName);
final _game = GetStorage(_gameName);
final _user = GetStorage(_userName);

class _StoreageItem<T> {
  final String name;
  late final Rx _rx;
  late final GetStorage storage;

  _StoreageItem(this.storage, this.name, T defaultValue) {
    _rx = (storage.read<T>(name) ?? defaultValue).obs;
  }

  T get value {
    return _rx.value;
  }

  set value(T val) {
    _rx.value = val;
    storage.write(name, val);
  }
}
