import 'package:skeletonizer/skeletonizer.dart';

import '../../apis/apis.dart';
import '../../mixins/mixin_date_picker.dart';
import '../../models/fund_record.model.dart';
import '../../shared/date_view/data_view_logic.dart';

class HistoryFundsController extends DataViewLogic<VicFundHisotryModel> with DatePickerMixin {
  @override
  fetch() async {
    final resp = await apis.user.queryRecords(payload: {'start': start, 'end': end, 'status': '2', 'page': page, 'size': size});
    return resp.list;
  }

  @override
  List<VicFundHisotryModel> provideMock() {
    final item = VicFundHisotryModel.fromJson({'remark': BoneMock.chars(24), 'time': BoneMock.chars(15), 'money': 1000});
    return List.filled(16, item);
  }
}
