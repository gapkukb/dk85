import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:victory/models/models.dart';
import 'package:victory/services/services.dart';

class VicFavController extends GetxController {
  VicFavController();

  final refresher = RefreshController();
  List<VicGameModel> get games => services.game.all.where((i) => i.liked).toList();

  @override
  void onInit() {
    services.game.queryLikes();
    super.onInit();
  }

  @override
  onClose() {
    refresher.dispose();
    super.onClose();
  }

  List<VicGameModel> mock() {
    return List.filled(24, VicGameModel.fromJson({'platform': 'one', 'name': BoneMock.words(8)}));
  }
}
