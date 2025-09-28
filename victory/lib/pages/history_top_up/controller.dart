import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:victory/apis/apis.dart';
import 'package:victory/mixins/mixin_date_picker.dart';
import 'package:victory/mixins/pagination.mixin.dart';
import 'package:victory/models/fund_record.model.dart';

class HistoryTopUpController extends GetxController with DatePickerMixin, PaginationMixin<VicFundHisotryModel> {
  HistoryTopUpController();

  @override
  VicFundHisotryModel get fakerItem =>
      VicFundHisotryModel.fromJson({'trade_no': 'ZF09012106009820898', 'time': BoneMock.date, 'status': 2, 'money': 1000});

  @override
  fetch() async {
    final r = await apis.user.queryRecords(
      payload: {
        'start': start,
        'end': end,
        'type': '1',
        // 'status':'',
        'page': page,
        'size': size,
      },
    );
    if (r == null) return (data: <VicFundHisotryModel>[], count: 0);
    return (data: r.list, count: r.count as int);
  }

  @override
  void onInit() {
    reset();
    super.onInit();
  }
}
