import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

part 'storage_item.dart';
part 'storage.dart';

Future initializeStorages() {
  return Future.wait([
    _global.initStorage,
    _game.initStorage,
    _user.initStorage,
  ]);
}
