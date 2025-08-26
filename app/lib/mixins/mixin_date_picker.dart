import 'package:app/shared/chooser/index.dart';
import 'package:app/shared/formatter/formatter.dart';
import 'package:get/get.dart';

mixin MixinDatePicker {
  final dateOptions = [
    Choose(title: 'Today', value: 0),
    Choose(title: 'Yesterday', value: 1),
    Choose(title: 'Last 3 days', value: 3),
    Choose(title: 'Last 7 days', value: 7),
    Choose(title: 'Last 30 days', value: 30),
  ];

  final date = 0.obs;

  final end = Formatter.dateTime.end(DateTime.now());

  get start {
    final d = DateTime.now().subtract(Duration(days: date.value));
    return Formatter.dateTime.start(d);
  }
}
