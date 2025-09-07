import 'package:app/logics/pagination.logic.dart';
import 'package:get/get.dart';
import 'package:app/apis/apis.dart';
import 'package:app/mixins/mixin_date_picker.dart';
import 'package:app/models/fund_record.model.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HistoryTopUpController extends GetxController with MixinDatePicker, PaginationLogic<FundRecord> {
  HistoryTopUpController();

  @override
  FundRecord get fakerItem => FundRecord.fromJson({'trade_no': 'ZF09012106009820898', 'time': BoneMock.date, 'status': 2, 'money': 1000});

  @override
  fetch() async {
    final resp = await apis.user.queryRecords(
      payload: {
        'start': start,
        'end': end,
        'type': '1',
        // 'status':'',
        'page': page,
        'size': size,
      },
    );

    return (data: resp.data.list, count: resp.data.count as int);
  }

  @override
  void onInit() {
    reset();
    super.onInit();
  }
}
