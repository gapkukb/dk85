import 'package:app/models/auth.model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

part 'dispatcher.dart';
part 'container.dart';

late final Storage storage;
final app = _Container(name: 'app');
final user = _Container(name: 'user');
final game = _Container(name: 'game');

List<T> Function(List) serialize<T>(T Function(Map<String, dynamic> json) decode) {
  return (json) {
    final a = json.map((i) => decode(i));
    return List<T>.from(a);
  };
}

class Storage {
  static Future initialize() {
    return Future.wait([app.storage.initStorage, user.storage.initStorage, game.storage.initStorage]).then((_) {
      storage = Storage();
    });
  }

  final locale = app.$string("locale", 'en');
  final music = app.$bool("music", true);
  final showGuide = app.$bool("show_guide", true);
  final token = app.$string("token", '');
  final deviceId = app.$string("device_id", '');
  // final list = app.$type<List<User>>("list", [], serialize(User.formJson));
}
