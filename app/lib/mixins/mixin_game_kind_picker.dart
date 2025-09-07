import 'package:app/shared/chooser/index.dart';
import 'package:get/get.dart';

mixin MixinGameKindPicker {
  final kindsOptions = [
    Choose(title: 'All', value: 'ALL'),
    Choose(title: 'slots', value: 'SLOTS'),
    Choose(title: 'fishing', value: 'FISH'),
    Choose(title: 'poker', value: 'POKER'),
  ];

  final kind = 'ALL'.obs;
}
