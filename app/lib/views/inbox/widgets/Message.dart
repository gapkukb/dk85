import 'package:app/iconfont/index.dart';
import 'package:app/routes/app_pages.dart';
import 'package:app/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

const messageTitleStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.bold,
  color: Color(0xff333333),
);
const messageSubtitleStyle = TextStyle(fontSize: 12, color: AppColors.label);
const messageDateStyle = TextStyle(fontSize: 12, color: AppColors.description);

class MessageWidget extends GetView<InboxController> {
  const MessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.inboxDetail, arguments: 1);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        height: 108,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '2D ထီထိုးခြင်း ခမ်းနားစွာ စတင်လိုက်ပြီ',
              style: messageTitleStyle,
            ),
            Text(
              '📅ဆုမဲဖွင့်သည့်အချိန်📅 တနင်္လာနေ့မှာသောကြာနေ့အထိ၊   【 စနေတနင်္ဂနွေမပါဝင်ပါ 】 နေ့စဥ်နှစ်ကြိမ်ဖွင့်သည် 【နေ့လည် 12;00】【 ညနေ 16;40】2025ရဲ့အမြင့်ဆုံးအွန်လိုင်းလျော်ကြေးအမြင့်ဆုံး95ဆပေးသည်။',
              style: messageSubtitleStyle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('2025-04-24 23:31:25', style: messageDateStyle),
                Icon(
                  IconFont.arrow_right_ios,
                  color: AppColors.description,
                  size: 12,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
