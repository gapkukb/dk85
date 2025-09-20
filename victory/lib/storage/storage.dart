import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
part 'wrapper.dart';

final _app = _Storage('app');
final _user = _Storage('user');
final _game = _Storage('game');

late final Storage storage;

class Storage {
  static Future initialize() async {
    await Future.wait([_app.init(), _game.init(), _game.init()]);
    storage = Storage();
  }

  final audio = _app.reactive('audio', true);
  final user = _user('user', false);
  final debug = _app('debug', false);
  final locale = _app.nullable<String>('locale');
}
