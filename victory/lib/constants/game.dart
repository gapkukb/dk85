import 'package:get/get.dart';

enum GameKind {
  all(0, 'all'),
  slots(1, 'slots'),
  fishing(2, 'fishing'),
  poker(3, 'poker');

  final int id;
  final String name;
  const GameKind(this.id, this.name);

  get displayName => 'app.$name'.tr;
}
