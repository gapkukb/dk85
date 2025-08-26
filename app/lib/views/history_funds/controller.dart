import 'package:app/mixins/mixin_date_picker.dart';
import 'package:app/shared/view_model/view_model.dart';
import 'package:flutter/material.dart';

class HistoryFundsController extends ViewModel with MixinDatePicker {
  HistoryFundsController();

  @override
  Future loader() {
    return Future.delayed(Durations.medium1);
  }
}
