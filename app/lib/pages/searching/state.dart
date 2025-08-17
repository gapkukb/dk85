import 'package:get/get.dart';

import '../../ui/options/option.dart';

const _kAll = '-1';

class SearchingState {
  final allPlatorm = [
    const Option(name: 'All', value: _kAll),
    const Option(name: 'JILI', value: 'jili'),
    const Option(name: 'ONE', value: 'one'),
    const Option(name: 'TWO', value: 'two'),
    const Option(name: 'THREE', value: 'three'),
    const Option(name: 'FOUR', value: 'four'),
  ];

  final kinds = [
    Option(name: 'app.all'.tr, value: _kAll),
    Option(name: 'app.slots'.tr, value: 'slots'),
    Option(name: 'app.fishing'.tr, value: 'fishing'),
    Option(name: 'app.poker'.tr, value: 'poker'),
  ];

  final platforms = [_kAll].obs;

  final games = [];

  reset() {
    platforms.value = [_kAll];
  }
}
