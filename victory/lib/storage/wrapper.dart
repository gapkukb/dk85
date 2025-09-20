part of 'storage.dart';

class _Storage {
  late final GetStorage _cache;

  _Storage(String name) {
    _cache = GetStorage(name);
  }

  _Reactive<T> reactive<T>(String name, T defaultValue) => _Reactive<T>(name, defaultValue, _cache);
  _Static<T> call<T>(String name, T defaultValue) => _Static<T>(name, defaultValue, _cache);
  _Static<T?> nullable<T>(String name) => _Static<T?>(name, null, _cache);

  Future init() {
    return _cache.initStorage;
  }
}

class _Reactive<T> {
  final String _name;
  final GetStorage storage;
  late final Rx<T> rxvlue;

  _Reactive(this._name, T defaultValue, this.storage) {
    rxvlue = Rx(storage.read<T>(_name) ?? defaultValue);
  }

  T get value => rxvlue.value;
  set value(T newValue) {
    rxvlue.value = newValue;
    storage.write(_name, newValue);
  }

  Future<void> update(T newValue) {
    rxvlue.value = newValue;
    return storage.write(_name, newValue);
  }

  void refresh() => rxvlue.refresh();

  void clear() {
    storage.remove(_name);
    rxvlue.close();
  }
}

class _Static<T> {
  final String _name;
  late T _value;
  final GetStorage storage;

  _Static(this._name, T defaultValue, this.storage) {
    _value = storage.read<T>(_name) ?? defaultValue;
  }

  T get value => _value;
  set value(T newValue) {
    _value = newValue;
    storage.write(_name, newValue);
  }

  Future<void> update(T newValue) {
    _value = newValue;
    return storage.write(_name, newValue);
  }

  clear() {
    storage.remove(_name);
  }
}
