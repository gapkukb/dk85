import 'package:flutter/material.dart';
import 'package:app/theme/index.dart';
import 'package:app/widgets/game/index.dart';

class SliverGameSection extends StatelessWidget {
  final String title;
  final List<dynamic> games;

  const SliverGameSection(this.title, this.games, {super.key});

  @override
  Widget build(BuildContext context) {
    if (games.isEmpty) {
      return SliverToBoxAdapter();
    }

    return SliverMainAxisGroup(
      slivers: [
        SliverPadding(padding: Gutter.top.normal),
        SliverToBoxAdapter(child: buildTitle(title)),
        SliverPadding(padding: Gutter.top.small),
        GameGridView.sliver(games: games),
      ],
    );
  }

  Widget buildTitle(String title) {
    return Container(
      // margin: Gutter.left.normal,
      padding: Gutter.left.small,
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: AppColors.highlight, width: 4)),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
