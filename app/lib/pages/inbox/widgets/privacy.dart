import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../ui/tile/index.dart';
import '/theme/index.dart';
import '../index.dart';

class PrivacyWidget extends GetView<InboxController> {
  const PrivacyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: ListTile.divideTiles(
        color: Colors.grey.shade100,
        context: context,
        tiles: [
          for (var i in List.filled(10, 0))
            const AkTile(
              // valueStyle: TextStyle(fontSize: 12, color: AppColors.label),
              title: Text("个人消息个人消息个人消息个人消息个人消息个人消息个人消息个人消息个人消息个人消息个人消息", maxLines: 1),

              // subtitle: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("2020-12-12 10:00:00")]),
            ),
        ],
      ).toList(),
    );
  }
}
