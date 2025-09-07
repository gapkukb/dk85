import 'package:app/mixins/mixin_date_picker.dart';
import 'package:app/mixins/mixin_game_kind_picker.dart';
import 'package:app/logics/pagination.logic.dart';
import 'package:app/models/game_record.model.dart';
import 'package:get/get.dart';
import 'package:app/apis/apis.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HistoryGamesController extends GetxController with MixinDatePicker, MixinGameKindPicker, PaginationLogic<GameRecord> {
  HistoryGamesController();

  @override
  GameRecord get fakerItem => GameRecord.fromJson({'inning_no': 'ZF09012106009820898', 'valid_amount': 1000, 'bet_time': BoneMock.date, 'name': BoneMock.name, 'winAmount': 1000});

  @override
  fetch() async {
    final payload = {'start_date': start, 'end_date': end, 'platform': 'one_api_game', 'page': page, 'size': size};
    if (kind.value != 'ALL') {
      payload['cate'] = kind.value;
    }
    final resp = await apis.user.queryGameRecords(payload: payload);

    return (data: resp.data.list, count: resp.data.count);
  }

  @override
  void onInit() {
    reset();
    super.onInit();
  }
}
