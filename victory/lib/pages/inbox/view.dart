import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/back_button/back_button.dart';
import '../../models/inbox.model.dart';
import '../../shared/date_view/data_view.dart';
import 'index.dart';
import 'widgets/widgets.dart';

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
