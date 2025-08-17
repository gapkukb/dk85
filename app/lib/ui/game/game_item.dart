part of 'index.dart';

final _kPlaceholderImage = Container(
  width: double.infinity,
  height: double.infinity,
  color: Colors.black12,
  child: LayoutBuilder(
    builder: (context, constraints) {
      return Icon(IconFont.placeholder, size: min(constraints.maxHeight, constraints.maxWidth) / 2, color: Colors.black26);
    },
  ),
);

Widget _kPlaceholderImageBuilder(BuildContext context, String url, [Object? error]) {
  return _kPlaceholderImage;
}

class GameItemView extends StatelessWidget {
  final num likes;
  final bool isLike;

  const GameItemView({super.key, this.likes = 0, this.isLike = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: PlayingController.play,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(4)),
          // boxShadow: [BoxShadow(color: Colors.black.withAlpha(50), blurRadius: 2)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                AspectRatio(aspectRatio: 1, child: NetworkPicture(imageUrl: "https://imgcdn.knryywqf.com/upload/images/202501/8b8be1a0-127e-4d36-a196-419a7cb3bb31.png1")),
                const Positioned(
                  right: 0,
                  top: 0,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.black54),

                    child: Padding(
                      padding: EdgeInsetsGeometry.only(left: 4, right: 4),
                      child: Text(
                        "ONE",
                        style: TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 4),
            //   child: ExtendedText("sss${'\u{200B}' * 10000}", maxLines: 2, softWrap: false, overflowWidget: const TextOverflowWidget(child: Icon(IconFont.heart_fill))),
            // ),
            // const Row(
            //   // spacing: 4,
            //   children: [
            //     SizedBox(width: 4),
            //     Flexible(child: Text("shankoemee", maxLines: 1, softWrap: false, overflow: TextOverflow.ellipsis)),
            //     FavButton(),
            //   ],
            // ),
            const Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 4, vertical: 4),
              child: Text(
                "ကံကြမ္မာကျောက်မျက် 4",
                maxLines: 1,
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
            const Align(alignment: Alignment.centerRight, child: FavButton()),
          ],
        ),
      ),
    );
  }
}

class FavButton extends StatefulWidget {
  const FavButton({super.key});

  @override
  State<FavButton> createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 28,
      child: IconButton(
        padding: EdgeInsets.zero,
        // icon: Icon(IconFont.heart, color: Colors.black, size: 16),
        icon: const Icon(IconFont.heart_fill, color: Color(0xffff5800), size: 16),
        onPressed: () {},
      ),
    );
  }
}
