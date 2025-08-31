part of 'storage.dart';

class _Dispatcher<T> {
  final String name;
  final GetStorage storage;
  final Function? decoder;
  final T defaultValue;
  late final Rx<T> _rx;

  _Dispatcher(this.storage, this.name, this.defaultValue, [this.decoder]) {
    dynamic raw = storage.read(name);
    if (raw == null) {
      raw = defaultValue;
    } else if (decoder != null) {
      raw = decoder!(raw);
    }
    _rx = Rx(raw);
  }

  T get value => _rx.value;

  /// 实体类必须传入第二个参数 - 反序列化
  void update(T value, [dynamic savedData]) {
    storage.write(name, savedData ?? value);
    _rx.value = value;
  }

  refresh() {
    _rx.refresh();
  }

  clear() {
    _rx.value = defaultValue;
    storage.remove(name);
  }
}
