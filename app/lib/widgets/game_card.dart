import '/iconfont/index.dart';
import '/widgets/network_picture.dart';
import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {
  final num likes;
  final bool isLike;

  const GameCard({super.key, this.likes = 0, this.isLike = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: PlayingController.play,
      child: Container(
        clipBehavior: Clip.hardEdge,

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          boxShadow: [
            BoxShadow(color: Colors.black.withAlpha(50), blurRadius: 2),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: NetworkPicture(
                imageUrl:
                    "https://hkp-s3.imgscache.com/bf91648b273c44338c4d8c7b5f1521e4123",
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                "Super Ace Jackpot",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Color(0xff111111),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${(likes)} Likes",
                    style: const TextStyle(
                      color: Color(0xff666666),
                      fontSize: 12,
                    ),
                  ),
                  SizedBox.square(
                    dimension: 28,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      // icon: Icon(IconFont.heart, color: Colors.black, size: 16),
                      icon: const Icon(
                        IconFont.heart_fill,
                        color: Color(0xffff5800),
                        size: 16,
                      ),
                      onPressed: () {},
                    ),
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
