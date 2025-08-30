part of 'index.dart';

const _appName = 'app';
const _gameName = 'game';
const _userName = 'user';

/// 基础缓存容器
final app = GetStorage(_appName);

/// 游戏缓存容器
final _game = GetStorage(_gameName);

/// 用户信息缓存容器
final _user = GetStorage(_userName);

class _StorageItem<T> {
  final String name;
  late final Rx _rx;
  final GetStorage storage;

  _StorageItem(this.storage, this.name, T defaultValue) {
    _rx = (storage.read<T>(name) ?? defaultValue).obs;
  }

  T get value {
    return _rx.value;
  }

  set value(T val) {
    _rx.value = val;
    storage.write(name, val);
  }

  refresh() {
    _rx.refresh();
  }

  remove() {
    storage.remove(name);
  }
}

class _StorageStaticItem<T> {
  final String name;
  late T _value;
  final GetStorage storage;

  _StorageStaticItem(this.storage, this.name, T defaultValue) {
    _value = storage.read<T>(name) ?? defaultValue;
  }

  T get value {
    return _value;
  }

  set value(T val) {
    _value = val;
    storage.write(name, val);
  }

  remove() {
    storage.remove(name);
  }
}
