import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/theme/index.dart';
import '../index.dart';

class SystemWidget extends GetView<InboxController> {
  const SystemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: ListTile.divideTiles(
        color: Colors.grey.shade100,
        context: context,
        tiles: [
          for (var i in List.filled(10, 0))
            const ListTile(
              titleTextStyle: TextStyle(fontSize: 14),
              subtitleTextStyle: TextStyle(fontSize: 12, color: AppColors.label),
              title: Text("系统消息系统消息系统消息系统消息系统消息系统消息系统消息系统消息系统消息系统消息", maxLines: 1, overflow: TextOverflow.ellipsis),
              subtitle: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("2020-12-12 10:00:00")]),
            ),
        ],
      ).toList(),
    );
  }
}
