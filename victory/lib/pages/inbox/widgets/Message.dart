import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:victory/iconfont/iconfont.dart';
import 'package:victory/routes/app_pages.dart';
import 'package:victory/theme/theme.dart';

import 'package:victory/models/inbox.model.dart';

const messageTitleStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xff333333));
const messageSubtitleStyle = TextStyle(fontSize: 12, color: AppColors.label);
const messageDateStyle = TextStyle(fontSize: 12, color: AppColors.description);

class MessageWidget extends StatelessWidget {
  final VicInboxModel message;
  const MessageWidget(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.inboxDetail, arguments: message);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(8)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(message.title, style: messageTitleStyle),
            Padding(
              padding: AppSizes.pad_x_8,
              child: Text(message.content, style: messageSubtitleStyle, maxLines: 2, overflow: TextOverflow.ellipsis),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(message.createdAt, style: messageDateStyle),
                const Icon(IconFont.arrow_right_ios, color: AppColors.description, size: 12),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
