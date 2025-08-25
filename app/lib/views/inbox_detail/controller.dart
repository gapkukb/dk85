import 'package:app/shared/view_model/view_model.dart';
import 'package:get/get.dart';

class InboxDetailController extends ViewModel {
  InboxDetailController();

  @override
  Future loader() async {
    await Future.delayed(Duration(seconds: 3));
  }
}
