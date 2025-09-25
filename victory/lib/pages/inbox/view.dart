import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:victory/components/back_button/back_button.dart';
import 'package:victory/models/inbox.model.dart';
import 'package:victory/shared/date_view/data_view.dart';
import 'package:victory/pages/inbox/index.dart';
import 'package:victory/pages/inbox/widgets/widgets.dart';

class VicInboxPage extends StatelessWidget {
  const VicInboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(InboxController());
    return Scaffold(
      appBar: AppBar(leading: const VicBackButton(), title: Text("inbox.title".tr)),
      body: SafeArea(
        child: VicDataView<VicInboxModel, InboxController>(
          controller: controller,
          enablePullUp: true,
          itemBuilder: (context, index, item) {
            return MessageWidget(item);
          },
          separatorBuilder: (context, index) => const SizedBox(height: 8),
        ),
      ),
    );
  }
}
