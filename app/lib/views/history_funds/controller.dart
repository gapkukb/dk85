import 'package:app/logics/pagination.logic.dart';
import 'package:get/get.dart';
import 'package:app/apis/apis.dart';
import 'package:app/mixins/mixin_date_picker.dart';
import 'package:app/models/fund_record.model.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HistoryFundsController extends GetxController with MixinDatePicker, PaginationLogic<FundRecord> {
  HistoryFundsController();

  @override
  FundRecord get fakerItem => FundRecord.fromJson({'remark': BoneMock.chars(24), 'time': BoneMock.chars(15), 'money': 1000});

  @override
  fetch() async {
    final resp = await apis.user.queryRecords(payload: {'start': start, 'end': end, 'status': '2', 'page': page, 'size': size});
    return (data: resp.data.list, count: resp.data.count as int);
  }

  @override
  void onInit() {
    reset();
    super.onInit();
  }
}
