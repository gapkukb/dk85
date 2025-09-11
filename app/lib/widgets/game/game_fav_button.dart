part of 'index.dart';

class GameFavButton extends StatefulWidget {
  final num platormId;
  final num gameId;
  bool liked;
  GameFavButton({super.key, this.liked = false, required this.platormId, required this.gameId});

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
          await f(payload: {'game_id': widget.platormId, 'favorite_id': widget.gameId});
          widget.liked = !widget.liked;
          setState(() {});
        },
      ),
    );
  }

  // void fav() async {
  //   await apis.user.addFavorite(payload: {'game_id': widget.platormId, 'favorite_id': widget.gameId});
  //   widget.liked = true;
  //   setState(() {});
  // }

  // void unfav() async {
  //   await apis.user.removeFavorite(payload: {'game_id': widget.platormId, 'favorite_id': widget.gameId});
  //   widget.liked = false;
  //   setState(() {});
  // }
}
