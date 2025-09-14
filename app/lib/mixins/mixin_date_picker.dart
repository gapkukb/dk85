import 'package:app/shared/chooser/index.dart';
import 'package:app/shared/formatter/formatter.dart';
import 'package:get/get.dart';

mixin MixinDatePicker {
  bool get show30days => true;
  List<Choose<int>> get dateOptions {
    final optinos = [Choose(title: 'Today', value: 0), Choose(title: 'Yesterday', value: 1), Choose(title: 'Last 3 days', value: 3), Choose(title: 'Last 7 days', value: 7)];

    if (show30days) {
      optinos.add(Choose(title: 'Last 30 days', value: 30));
    }

    return optinos;
  }

  final date = 0.obs;

  final end = Formatter.dateTime.end(DateTime.now());

  String get start {
    final d = DateTime.now().subtract(Duration(days: date.value));
    return Formatter.dateTime.start(d);
  }
}
