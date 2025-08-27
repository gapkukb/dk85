import 'package:app/modal_manager/modal_manager.dart';
import 'package:app/modal_views/announcement/announcement.dart';
import 'package:app/modal_views/top_up_bonus/top_up_bonus.dart';
import 'package:app/modal_views/try_game/try_game.dart';

void modalTest() {
  ModalManager.add(
    ModalInstance(id: '1', priority: 1, builder: () => TopUpBonusModal()),
  );
  ModalManager.add(
    ModalInstance(id: '2', priority: 1, builder: () => TryGameModal()),
  );
  ModalManager.add(
    ModalInstance(id: '3', priority: 1, builder: () => AnnouncementModal()),
  );
}
