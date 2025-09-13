import 'package:app/models/inbox.model.dart';
import 'package:app/shared/date_view/data_view.dart';
import 'package:app/widgets/back_button/back_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class InboxView extends StatelessWidget {
  const InboxView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(InboxController());
    return Scaffold(
      appBar: AppBar(leading: AKBackButton(), title: Text("inbox.title".tr)),
      body: SafeArea(
        child: DataView<InboxModel, InboxController>(
          controller: controller,
          enablePullUp: true,
          itemBuilder: (context, index, item) {
            return MessageWidget(item);
          },
          separatorBuilder: (context, index) => SizedBox(height: 8),
        ),
      ),
    );
  }
}
