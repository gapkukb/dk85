part of 'game.dart';

class VicGameItem extends StatelessWidget {
  final num likes;
  final Game game;

  const VicGameItem({super.key, this.likes = 0, required this.game});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GamingPage.playGame(game),
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
                    child: VicNetworkImage(imageUrl: game.img),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Skeleton.ignore(
                    child: DecoratedBox(
                      decoration: const BoxDecoration(color: Colors.black54),
                      child: Padding(
                        padding: const EdgeInsetsGeometry.only(left: 4, right: 4),
                        child: Text(
                          game.platform,
                          style: const TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(left: 4, top: 4),
              child: Row(
                children: [
                  Expanded(
                    child: Text(game.name, maxLines: 1, softWrap: false, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 12)),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: VicFavButton(gameId: game.id, platormId: 17, liked: game.liked),
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
