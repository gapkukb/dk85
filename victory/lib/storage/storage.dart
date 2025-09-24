import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
part 'wrapper.dart';

final _app = _Storage('app');
// game数据量会比较大，单开一个存储容器
final _game = _Storage('game');

late final Storage storage;

class Storage {
  static Future ensureInitialized() async {
    await Future.wait([_app.init(), _game.init()]);
    storage = Storage();
  }

  final proxyHost = _app.nullable<String>('charles_host');
  final proxyPort = _app.nullable<int>('charles_port');
  final audio = _app.reactive('audio', true);
  final user = _app.nullable<Map<String, dynamic>>('user');
  final token = _app.reactive("token", '');
  final locale = _app.nullable<String>('locale');
  final appInfo = _app.nullable<Map<String, dynamic>>("app_info");
  final debug = _app('debug', false);
  final deviceId = _app("device_id", '');
  final showGuide = _app("show_guide", true);
}
