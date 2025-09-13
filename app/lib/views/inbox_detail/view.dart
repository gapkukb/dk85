import 'package:app/models/inbox.model.dart';
import 'package:app/shared/single_child_view/single_child_view.dart';
import 'package:app/views/inbox/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InboxDetailView extends StatelessWidget {
  const InboxDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final InboxModel message = Get.arguments as InboxModel;
    return AKSingleChildScrollView(
      loading: false,
      title: 'inbox.detail'.tr,
      children: [
        Text(message.title, style: messageTitleStyle),
        SizedBox(height: 8),
        Text(message.content, style: messageDateStyle),
        SizedBox(height: 8),
        Text(message.createdAt, style: messageSubtitleStyle),
      ],
    );
  }
}
