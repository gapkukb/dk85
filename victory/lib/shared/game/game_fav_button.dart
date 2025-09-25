part of 'game.dart';

class VicFavButton extends StatefulWidget {
  final num platormId;
  final num gameId;
  bool liked;
  ValueChanged<bool>? onLike;
  VicFavButton({super.key, this.liked = false, required this.platormId, required this.gameId, this.onLike});

  @override
  State<VicFavButton> createState() => _VicFavButtonState();
}

class _VicFavButtonState extends State<VicFavButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 28,
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(widget.liked ? IconFont.heart_fill : IconFont.heart, color: widget.liked ? const Color(0xffff5800) : Colors.black, size: 16),
        onPressed: () async {
          if (services.auth.ensureAuthorized) {
            talker.debug("fav ${widget.gameId} ${widget.platormId} ${widget.liked} ");
            final f = widget.liked ? apis.game.unfavorite : apis.game.favorite;
            await f(payload: {'platform_id': widget.platormId, 'game_id': widget.gameId});
            widget.liked = !widget.liked;
            services.game.queryLikes();
            widget.onLike?.call(widget.liked);
            setState(() {});
          }
        },
      ),
    );
  }
}
