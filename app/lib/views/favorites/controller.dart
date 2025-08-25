import 'package:app/shared/view_model/view_model.dart';
import 'package:get/get.dart';

import 'index.dart';

class FavoritesController extends ViewModel {
  FavoritesController();

  @override
  Future loader() async {
    await Future.delayed(Duration(seconds: 1));
  }
}
