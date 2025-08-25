import 'package:app/widgets/game/index.dart';
import 'package:flutter/material.dart';

class SlotsView extends StatefulWidget {
  const SlotsView({Key? key}) : super(key: key);

  @override
  _SlotsViewState createState() => _SlotsViewState();
}

class _SlotsViewState extends State<SlotsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(8),
            sliver: GameGridView.sliver(
              gameList: List.generate(100, (_) => {}),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(8),
            sliver: GameGridView.sliver(
              gameList: List.generate(100, (_) => {}),
            ),
          ),
        ],
      ),
    );
  }
}
