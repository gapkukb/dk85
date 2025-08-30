part of 'index.dart';

class GameGridView extends StatelessWidget {
  static const delegate = SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
    mainAxisSpacing: 8,
    crossAxisSpacing: 8,
    childAspectRatio: 76 / 100,
  );

  final List<dynamic> gameList;
  final bool _sliver;

  const GameGridView({super.key, this.gameList = const []}) : _sliver = false;

  @override
  Widget build(BuildContext context) {
    return (_sliver ? SliverGrid.builder : GridView.builder)(
      itemCount: gameList.length,
      gridDelegate: delegate,
      itemBuilder: (context, index) {
        return GameItemView(isLike: false, likes: 0, game: gameList[index]);
      },
    );
  }

  const GameGridView.sliver({super.key, this.gameList = const []})
    : _sliver = true;
}
