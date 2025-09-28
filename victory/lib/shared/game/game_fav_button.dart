part of 'game.dart';

class VicFavButton extends StatefulWidget {
  final VicGameModel game;
  final ValueChanged<bool>? onChanged;
  const VicFavButton({super.key, required this.game, this.onChanged});

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
        icon: Obx(
          () => Icon(
            widget.game.liked.value ? IconFont.heart_fill : IconFont.heart,
            color: widget.game.liked.value ? const Color(0xffff5800) : Colors.black,
            size: 16,
          ),
        ),
        onPressed: () async {
          await services.game.switchFavorite(widget.game);
          widget.onChanged?.call(widget.game.liked.value);
          setState(() {});
        },
      ),
    );
  }
}
