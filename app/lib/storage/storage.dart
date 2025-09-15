import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

part 'dispatcher.dart';
part 'container.dart';

class _Box {
  final app = _Container(name: 'app');
  final user = _Container(name: 'user');
  final game = _Container(name: 'game');
}

final _box = _Box();
late final Storage storage;

class Storage {
  static Future initialize() async {
    await Future.wait([_box.app.storage.initStorage, _box.user.storage.initStorage, _box.game.storage.initStorage]);
    storage = Storage();
  }

  final box = _box;
  final locale = _box.app.$string("locale", 'my');
  final audio = _box.app.$bool("music", true);
  final showGuide = _box.app.$bool("show_guide", true);
  final token = _box.app.$string("token", '');
  final deviceId = _box.app.$string("device_id", '');
}
