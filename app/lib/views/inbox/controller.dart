import 'package:app/apis/apis.dart';
import 'package:app/models/inbox.model.dart';
import 'package:app/shared/date_view/data_view_logic.dart';
import 'package:skeletonizer/skeletonizer.dart';

class InboxController extends DataViewLogic<InboxModel> {
  @override
  int get size => 20;
  @override
  fetch() async {
    final r = await apis.user.queryInbox(payload: {'page': 1, 'size': size}).whenComplete(() {
      loading.value = false;
    });
    count = r.data.count;
    return r.data.list;
  }

  @override
  List<InboxModel> provideMock() {
    final item = InboxModel.fromJson({"title": BoneMock.words(4), "content": BoneMock.words(14), "created_at": BoneMock.words(3)});
    return List.filled(8, item);
  }
}
