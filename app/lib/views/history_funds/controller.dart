import 'package:app/shared/date_view/data_view_logic.dart';
import 'package:app/apis/apis.dart';
import 'package:app/mixins/mixin_date_picker.dart';
import 'package:app/models/fund_record.model.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HistoryFundsController extends DataViewLogic<FundRecord> with MixinDatePicker {
  @override
  fetch() async {
    final resp = await apis.user.queryRecords(payload: {'start': start, 'end': end, 'status': '2', 'page': page, 'size': size});
    return resp.data.list;
  }

  @override
  List<FundRecord> provideMock() {
    final item = FundRecord.fromJson({'remark': BoneMock.chars(24), 'time': BoneMock.chars(15), 'money': 1000});
    return List.filled(16, item);
  }
}
