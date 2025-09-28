import 'package:skeletonizer/skeletonizer.dart';

import 'package:victory/apis/apis.dart';
import 'package:victory/mixins/mixin_date_picker.dart';
import 'package:victory/mixins/mixin_game_kind_picker.dart';
import 'package:victory/models/game_record.model.dart';
import 'package:victory/models/models.dart';
import 'package:victory/shared/date_view/data_view_logic.dart';

class HistoryGamesController extends DataViewLogic<VicGameHistoryModel> with DatePickerMixin, GameKindPickerMixin {
  @override
  bool get show30days => false;

  @override
  fetch() async {
    final payload = {'start_date': start, 'end_date': end, 'platform': 'one_api_game', 'page': page, 'size': size};
    if (kind.value != 'ALL') {
      payload['cate'] = kind.value;
    }
    final r = await apis.user.queryGameRecords(payload: payload);
    if (r == null) return [];
    count = r.count;
    return r.list;
  }

  @override
  List<VicGameHistoryModel> provideMock() {
    final item = VicGameHistoryModel.fromJson({
      'inning_no': 'ZF09012106009820898',
      'valid_amount': 1000,
      'bet_time': BoneMock.date,
      'name': BoneMock.name,
      'winAmount': 1000,
    });
    return List.filled(10, item);
  }
}
