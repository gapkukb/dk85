import 'package:get/get.dart';

import '../components/action_sheet/action_sheet.dart';

mixin GameKindPickerMixin {
  final kindsActions = [
    const VicAction(title: 'All', value: 'ALL'),
    const VicAction(title: 'Slots', value: 'SLOTS'),
    const VicAction(title: 'Fishing', value: 'FISH'),
    const VicAction(title: 'Poker', value: 'POKER'),
  ];

  final kind = 'ALL'.obs;

  String get kindLabel => kindsActions
      .firstWhere(
        (i) => i.value == kind.value,
        orElse: () => kindsActions.first,
      )
      .title;
}
