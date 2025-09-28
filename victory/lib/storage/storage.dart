import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
part 'wrapper.dart';

late final Storage storage;

class Storage {
  static final _app = _Storage('app');
  // game数据量会比较大，单开一个存储容器
  static final _game = _Storage('game');

  static Future ensureInitialized() async {
    await Future.wait([_app.init(), _game.init()]);
    storage = Storage();
  }

  _Storage get app => _app;
  _Storage get game => _game;

  final proxyHost = _app.nullable<String>('charles_host');
  final proxyPort = _app.nullable<int>('charles_port');
  final audio = _app.reactive('audio', true);
  final user = _app.nullable<Map<String, dynamic>>('user');
  final token = _app.reactive("token", '');
  final locale = _app.nullable<String>('locale');
  final dviceId = _app.nullable<String>("dviceId");
  final debug = _app('debug', false);
  final deviceId = _app("device_id", '');
  final showGuide = _app("show_guide", true);
}
