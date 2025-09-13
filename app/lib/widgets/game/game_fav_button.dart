part of 'index.dart';

class GameFavButton extends StatefulWidget {
  final num platormId;
  final num gameId;
  bool liked;
  ValueChanged<bool>? onLike;
  GameFavButton({super.key, this.liked = false, required this.platormId, required this.gameId, this.onLike});

  @override
  State<GameFavButton> createState() => _GameFavButtonState();
}

class _GameFavButtonState extends State<GameFavButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 28,
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(widget.liked ? IconFont.heart_fill : IconFont.heart, color: widget.liked ? Color(0xffff5800) : Colors.black, size: 16),
        onPressed: () async {
          final f = widget.liked ? apis.user.removeFavorite : apis.user.addFavorite;
          await f(payload: {'platform_id': widget.platormId, 'game_id': widget.gameId});
          widget.liked = !widget.liked;
          services.game.queryLikes();
          // setState(() {});
          widget.onLike?.call(widget.liked);
        },
      ),
    );
  }
}
