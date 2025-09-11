part of 'index.dart';

class GameItemView extends StatelessWidget {
  final num likes;
  final bool isLike;
  final GameModel game;

  const GameItemView({super.key, this.likes = 0, this.isLike = false, required this.game});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GamingView.play(game),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Skeleton.replace(
                    replacement: Container(color: AppColors.skeleton),
                    child: NetworkPicture(imageUrl: game.img),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Skeleton.ignore(
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.black54),
                      child: Padding(
                        padding: EdgeInsetsGeometry.only(left: 4, right: 4),
                        child: Text(
                          game.platform,
                          style: TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.only(left: 4, top: 4),
              child: Row(
                children: [
                  Expanded(
                    child: Text(game.name, maxLines: 1, softWrap: false, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12)),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GameFavButton(gameId: game.id, platormId: 17),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
