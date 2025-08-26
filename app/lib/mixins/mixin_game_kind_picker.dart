import 'package:app/shared/chooser/index.dart';
import 'package:get/get.dart';

mixin MixinGameKindPicker {
  final kindsOptions = [
    Choose(title: 'All', value: 'all'),
    Choose(title: 'slots', value: 'slots'),
    Choose(title: 'fishing', value: 'fishing'),
    Choose(title: 'poker', value: 'poker'),
  ];

  final kind = 'all'.obs;
}
