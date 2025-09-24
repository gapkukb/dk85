import '../../shared/view_model/view_model.dart';

class InboxDetailController extends VicViewModel {
  @override
  Future loader() async {
    await Future.delayed(const Duration(seconds: 3));
  }
}
