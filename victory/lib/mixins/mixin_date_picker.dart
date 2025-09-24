import 'package:get/get.dart';

import '../components/action_sheet/action_sheet.dart';
import '../components/formatter/formatter.dart';

mixin DatePickerMixin {
  bool get show30days => true;
  List<VicAction<int>> get dateActions {
    final optinos = [
      const VicAction(title: 'Today', value: 0),
      const VicAction(title: 'Yesterday', value: 1),
      const VicAction(title: 'Last 3 days', value: 3),
      const VicAction(title: 'Last 7 days', value: 7),
    ];

    if (show30days) {
      optinos.add(const VicAction(title: 'Last 30 days', value: 30));
    }

    return optinos;
  }

  final date = 0.obs;

  final end = VicFormatter.dateTime.end(DateTime.now());

  String get start {
    final d = DateTime.now().subtract(Duration(days: date.value));
    return VicFormatter.dateTime.start(d);
  }
}
