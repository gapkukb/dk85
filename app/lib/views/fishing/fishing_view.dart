import 'package:app/helper/group_games.dart';
import 'package:app/services/index.dart';
import 'package:app/widgets/game/game_page.dart';
import 'package:flutter/material.dart';

class FishingView extends StatefulWidget {
  const FishingView({super.key});

  @override
  _FishingViewState createState() => _FishingViewState();
}

class _FishingViewState extends State<FishingView> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GamePageView(dataBuilder: () => services.game.fish, adPosition: 3);
  }

  @override
  bool get wantKeepAlive => true;
}
