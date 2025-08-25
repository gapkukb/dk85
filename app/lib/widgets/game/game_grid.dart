part of 'index.dart';

class GameGridView extends StatelessWidget {
  static const delegate = SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
    mainAxisSpacing: 8,
    crossAxisSpacing: 8,
    childAspectRatio: 67 / 100,
  );

  final List<dynamic> gameList;
  final int crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double childAspectRatio;
  final double? mainAxisExtent;
  final bool _sliver;

  const GameGridView({
    super.key,
    this.gameList = const [],
    this.crossAxisCount = 3,
    this.mainAxisSpacing = 8,
    this.crossAxisSpacing = 8,
    this.childAspectRatio = 67 / 100,
    this.mainAxisExtent,
  }) : _sliver = false;

  @override
  Widget build(BuildContext context) {
    return (_sliver ? SliverGrid.builder : GridView.builder)(
      itemCount: gameList.length,
      gridDelegate: delegate,
      itemBuilder: (context, index) {
        return const GameItemView(isLike: false, likes: 0);
      },
    );
  }

  const GameGridView.sliver({
    super.key,
    this.gameList = const [],
    this.crossAxisCount = 3,
    this.mainAxisSpacing = 8,
    this.crossAxisSpacing = 8,
    this.childAspectRatio = 67 / 100,
    this.mainAxisExtent,
  }) : _sliver = true;
}
