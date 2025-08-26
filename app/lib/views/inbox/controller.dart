import 'package:app/shared/view_model/view_model.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/src/smart_refresher.dart';

import 'index.dart';

class InboxController extends ViewModel {
  // InboxController();
  @override
  final RefreshController refresher = RefreshController();
  final messages = <num>[...List.generate(20, (index) => index)].obs;

  @override
  Future loader() {
    // TODO: implement loader
    throw UnimplementedError();
  }
}
