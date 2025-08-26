import 'package:app/mixins/mixin_date_picker.dart';
import 'package:app/mixins/mixin_game_kind_picker.dart';
import 'package:app/shared/view_model/view_model.dart';
import 'package:flutter/material.dart';

class HistoryGamesController extends ViewModel
    with MixinDatePicker, MixinGameKindPicker {
  HistoryGamesController();

  @override
  Future loader() {
    debugPrint('开始请求');
    return Future.delayed(Durations.medium1);
  }
}
