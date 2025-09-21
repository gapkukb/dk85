import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../../styles/size.dart';
import '../../styles/styles.dart';
import 'game.dart';

class VicGameSection extends StatelessWidget {
  final String title;
  final List<Game> games;

  const VicGameSection(this.title, this.games, {super.key});

  @override
  Widget build(BuildContext context) {
    if (games.isEmpty) {
      return const SliverToBoxAdapter();
    }

    return SliverPadding(
      padding: AppSize.pad_not_t_12,
      sliver: SliverMainAxisGroup(
        slivers: [
          const SliverPadding(padding: AppSize.pad_t_12),
          SliverToBoxAdapter(child: buildTitle(title)),
          const SliverPadding(padding: AppSize.pad_t_8),
          VicGameGrid.sliver(gameList: games),
        ],
      ),
    );
  }

  Widget buildTitle(String title) {
    return Container(
      // margin: Gutter.left.normal,
      padding: AppSize.pad_l_4,
      decoration: BoxDecoration(
        border: const Border(left: BorderSide(color: AppColor.highlight, width: 4)),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
