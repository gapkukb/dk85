part of 'index.dart';

class GameGridView extends StatelessWidget {
  final List<dynamic>? gameList;
  final int crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double childAspectRatio;
  final double? mainAxisExtent;

  const GameGridView({super.key, this.gameList, this.crossAxisCount = 3, this.mainAxisSpacing = 8, this.crossAxisSpacing = 8, this.childAspectRatio = 67 / 100, this.mainAxisExtent});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      itemCount: 100,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: mainAxisSpacing,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisExtent: mainAxisExtent,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) {
        return const GameItemView(isLike: false, likes: 0);
      },
    );
  }
}
