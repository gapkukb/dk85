import 'package:app/iconfont/index.dart';
import 'package:app/models/inbox.model.dart';
import 'package:app/routes/app_pages.dart';
import 'package:app/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const messageTitleStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xff333333));
const messageSubtitleStyle = TextStyle(fontSize: 12, color: AppColors.label);
const messageDateStyle = TextStyle(fontSize: 12, color: AppColors.description);

class MessageWidget extends StatelessWidget {
  final InboxModel message;
  const MessageWidget(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.inboxDetail, arguments: message);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(8)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(message.title, style: messageTitleStyle),
            Padding(
              padding: Gutter.vertical.small,
              child: Text(message.content, style: messageSubtitleStyle, maxLines: 2, overflow: TextOverflow.ellipsis),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(message.createdAt, style: messageDateStyle),
                Icon(IconFont.arrow_right_ios, color: AppColors.description, size: 12),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
