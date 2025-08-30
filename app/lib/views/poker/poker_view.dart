import 'package:app/services/index.dart';
import 'package:app/widgets/game/game_page.dart';
import 'package:flutter/material.dart';

class PokerView extends StatefulWidget {
  const PokerView({super.key});

  @override
  _PokerViewState createState() => _PokerViewState();
}

class _PokerViewState extends State<PokerView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GamePageView(dataBuilder: () => GameService.to.poker, adPosition: 4);
  }

  @override
  bool get wantKeepAlive => true;
}
