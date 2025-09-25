import 'package:skeletonizer/skeletonizer.dart';

import 'package:victory/apis/apis.dart';
import 'package:victory/models/inbox.model.dart';
import 'package:victory/shared/date_view/data_view_logic.dart';

class InboxController extends DataViewLogic<VicInboxModel> {
  @override
  int get size => 20;
  @override
  fetch() async {
    final r = await apis.user.queryInbox(payload: {'page': 1, 'size': size}).whenComplete(() {
      loading.value = false;
    });
    count = r.count;
    return r.list;
  }

  @override
  List<VicInboxModel> provideMock() {
    final item = VicInboxModel.fromJson({"title": BoneMock.words(4), "content": BoneMock.words(14), "created_at": BoneMock.words(3)});
    return List.filled(8, item);
  }
}
