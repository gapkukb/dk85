part of 'game.dart';

class VicGameGrid extends StatelessWidget {
  static const delegate = SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
    mainAxisSpacing: 8,
    crossAxisSpacing: 8,
    childAspectRatio: 76 / 100,
  );

  final List<VicGameModel> gameList;
  final bool _sliver;
  final bool loading;
  final RefreshController? refresher;
  final int mockCount;
  final Widget Function()? empty;

  const VicGameGrid({super.key, this.gameList = const [], this.loading = false, this.refresher, this.mockCount = 24, this.empty}) : _sliver = false;

  @override
  Widget build(BuildContext context) {
    final view = buildView();
    if (loading) {
      if (_sliver) return Skeletonizer.sliver(enabled: true, child: view);
      return Skeletonizer(enabled: true, child: view);
    }

    if (gameList.isEmpty) return empty?.call() ?? const VicStateBlock();

    if (refresher == null) return view;

    return SmartRefresher(controller: refresher!, child: view);
  }

  const VicGameGrid.sliver({super.key, this.gameList = const [], this.loading = false, this.refresher, this.mockCount = 24, this.empty})
    : _sliver = true;

  List<VicGameModel> mock() {
    return List.filled(mockCount, VicGameModel.fromJson({'platform': 'one', 'name': BoneMock.words(8)}));
  }

  Widget buildView() {
    final List<VicGameModel> n = loading ? mock() : gameList;

    return (_sliver ? SliverGrid.builder : GridView.builder)(
      itemCount: n.length,
      gridDelegate: delegate,
      itemBuilder: (context, index) {
        return VicGameItem(likes: 0, game: n[index]);
      },
    );
  }
}
