import 'package:app/helper/group_games.dart';
import 'package:app/services/index.dart';
import 'package:app/widgets/game/game_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class PokerView extends StatefulWidget {
  const PokerView({super.key});

  @override
  _PokerViewState createState() => _PokerViewState();
}

class _PokerViewState extends State<PokerView>
    with AutomaticKeepAliveClientMixin {
  GroupGames get games => GroupGames(GameService.to.all.value?.fish);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: CustomScrollView(
          slivers: [
            Obx(() => SliverGameSection("Hot Games", games.hotGames)),
            Obx(() => SliverGameSection("New Games", games.newGames)),
            Obx(() => SliverGameSection("All Games", games.others)),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
