part of 'storage.dart';

class _Container {
  final String name;
  late final GetStorage storage;
  _Container({required this.name}) {
    storage = GetStorage(name);
  }

  _Dispatcher<num> $num(String name, num defautValue) {
    return _Dispatcher(storage, name, defautValue);
  }

  _Dispatcher<String> $string(String name, String defautValue) {
    return _Dispatcher(storage, name, defautValue);
  }

  _Dispatcher<bool> $bool(String name, bool defautValue) {
    return _Dispatcher(storage, name, defautValue);
  }

  _Dispatcher<Map<String, dynamic>> $map(String name, Map<String, dynamic> defautValue) {
    return _Dispatcher(storage, name, defautValue);
  }

  _Dispatcher<List<Map<String, dynamic>>> $list(String name, List<Map<String, dynamic>> defautValue) {
    return _Dispatcher(storage, name, defautValue);
  }

  _Dispatcher<T> $type<T>(String name, T defautValue, Function decoder) {
    return _Dispatcher(storage, name, defautValue, decoder);
  }

  _Dispatcher<T> $listType<T>(String name, T defautValue, Function decoder, Function encoder) {
    return _Dispatcher(storage, name, defautValue, decoder);
  }

  T? get<T>(String name, [T? defautValue]) {
    return storage.read<T>(name) ?? defautValue;
  }

  Future<void> set<T>(String name, T value) {
    return storage.write(name, value);
  }
}
