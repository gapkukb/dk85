import 'package:app/shared/single_child_view/single_child_view.dart';
import 'package:app/views/inbox/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'index.dart';

class InboxDetailView extends GetView<InboxDetailController> {
  const InboxDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InboxDetailController>(
      builder: (_) {
        return AKSingleChildScrollView(
          title: 'page.inbox.detail'.tr,
          children: [
            Text(BoneMock.title, style: messageTitleStyle),
            SizedBox(height: 8),
            Text(BoneMock.words(3), style: messageDateStyle),
            SizedBox(height: 8),
            Text(BoneMock.longParagraph, style: messageSubtitleStyle),
          ],
        );
      },
    );
  }
}
