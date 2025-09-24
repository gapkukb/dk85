import 'package:get/get.dart';

import '../components/action_sheet/action_sheet.dart';

mixin GameKindPickerMixin {
  final kindsOptions = [
    const VicAction(title: 'All', value: 'ALL'),
    const VicAction(title: 'slots', value: 'SLOTS'),
    const VicAction(title: 'fishing', value: 'FISH'),
    const VicAction(title: 'poker', value: 'POKER'),
  ];

  final kind = 'ALL'.obs;
}
