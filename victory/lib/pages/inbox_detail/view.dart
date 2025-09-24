import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/inbox.model.dart';
import '../../shared/single_child_view/single_child_view.dart';
import '../inbox/widgets/widgets.dart';

class VicInboxDetailsPage extends StatelessWidget {
  const VicInboxDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final VicInboxModel message = Get.arguments as VicInboxModel;
    return VicStateScrollView(
      loading: false,
      title: 'inbox.detail'.tr,
      children: [
        Text(message.title, style: messageTitleStyle),
        const SizedBox(height: 8),
        Text(message.content, style: messageDateStyle),
        const SizedBox(height: 8),
        Text(message.createdAt, style: messageSubtitleStyle),
      ],
    );
  }
}
