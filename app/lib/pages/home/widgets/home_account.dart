import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../iconfont/index.dart';
import '../../../theme/index.dart';
import '../../../widgets/Balance.dart';
import '../../../widgets/Button.dart';
import '../../../widgets/refresh_button.dart';

class HomeAccount extends StatelessWidget {
  const HomeAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: ListTile(
        shape: const StadiumBorder(side: BorderSide(color: Color(0xffeeeeee))),
        tileColor: const Color(0xfff5f5f5),
        contentPadding: const EdgeInsets.symmetric(vertical: 1),
        minVerticalPadding: 0,
        minTileHeight: 32,
        minLeadingWidth: 32,
        horizontalTitleGap: 4,
        leading: const CircleAvatar(radius: 16, foregroundImage: CachedNetworkImageProvider("https://imgcdn.knryywqf.com/upload/images/202501/9a009b62-3d18-449c-ab2e-96feeabcb1c7.jpg")),
        title: Row(
          spacing: 4,
          children: [
            const Text("ID:123456", style: TextStyle(fontSize: 10, color: AppColors.description)),
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(color: AppColors.warn, borderRadius: BorderRadius.circular(2)),
              child: const Text("VIP1", style: TextStyle(fontSize: 6, color: Colors.white)),
            ),
          ],
        ),
        subtitle: Balance(
          child: const DecoratedBox(
            decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(100))),
            child: Padding(padding: EdgeInsets.all(3), child: Icon(IconFont.buyu, size: 10)),
          ),
          builder: (amount, child) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 4,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  amount.toString(),
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.primary),
                ),
                child,
              ],
            );
          },
        ),
      ),
    );
  }
}
