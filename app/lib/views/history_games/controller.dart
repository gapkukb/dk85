import 'package:app/mixins/mixin_date_picker.dart';
import 'package:app/mixins/mixin_game_kind_picker.dart';
import 'package:app/models/game_record.model.dart';
import 'package:app/shared/date_view/data_view_logic.dart';
import 'package:app/apis/apis.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HistoryGamesController extends DataViewLogic<GameRecord> with MixinDatePicker, MixinGameKindPicker {
  @override
  bool get show30days => false;

  @override
  fetch() async {
    final payload = {'start_date': start, 'end_date': end, 'platform': 'one_api_game', 'page': page, 'size': size};
    if (kind.value != 'ALL') {
      payload['cate'] = kind.value;
    }
    final resp = await apis.user.queryGameRecords(payload: payload);
    count = resp.data.count;
    return resp.data.list;
  }

  @override
  List<GameRecord> provideMock() {
    final item = GameRecord.fromJson({'inning_no': 'ZF09012106009820898', 'valid_amount': 1000, 'bet_time': BoneMock.date, 'name': BoneMock.name, 'winAmount': 1000});
    return List.filled(10, item);
  }
}
