import 'package:app/mixins/mixin_date_picker.dart';
import 'package:app/shared/view_model/view_model.dart';
import 'package:flutter/material.dart';

class HistoryTopUpController extends ViewModel with MixinDatePicker {
  HistoryTopUpController();

  @override
  Future loader() {
    debugPrint('开始请求');
    return Future.delayed(Durations.medium1);
  }
}
