import 'package:app/services/index.dart';
import 'package:app/widgets/game/game_page.dart';
import 'package:flutter/material.dart';

class SlotsView extends StatefulWidget {
  const SlotsView({super.key});

  @override
  _SlotsViewState createState() => _SlotsViewState();
}

class _SlotsViewState extends State<SlotsView> {
  @override
  Widget build(BuildContext context) {
    return GamePageView(dataBuilder: () => services.game.slots, adPosition: 2);
  }
}
