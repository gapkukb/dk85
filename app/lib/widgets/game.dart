import 'package:app/iconfont/index.dart';
import 'package:app/helper/formatter/index.dart';
import 'package:app/pages/playing/index.dart';
import 'package:app/theme/index.dart';
import 'package:app/widgets/network_picture.dart';
import 'package:flutter/material.dart';

class Game extends StatelessWidget {
  final num likes;
  final bool isLike;

  const Game({super.key, this.likes = 0, this.isLike = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: PlayingController.play,
      child: Container(
        clipBehavior: Clip.hardEdge,

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(4)),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                "Super Ace Jackpot",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColor.primary,
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
                    "${amountize(likes)} Likes",
                    style: TextStyle(color: AppColor.label, fontSize: 12),
                  ),
                  SizedBox.square(
                    dimension: 28,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      // icon: Icon(IconFont.heart, color: Colors.black, size: 16),
                      icon: Icon(
                        IconFont.heart_fill,
                        color: AppColor.main,
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
