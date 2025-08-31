import 'package:app/models/top_up.model.dart';
import 'package:flutter/material.dart';
import 'package:app/views/funds/funds_controller.dart';
import 'package:get/get.dart';
import '/iconfont/index.dart';
import '/theme/index.dart';
import '/widgets/network_picture.dart';

class TopUpView extends GetView<FundsController> {
  const TopUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.background,
      child: Obx(() {
        return ListView.separated(
          padding: const EdgeInsets.all(12),
          itemCount: controller.topUpChannels.length,
          separatorBuilder: (context, index) {
            return const SizedBox(height: 16);
          },
          itemBuilder: (context, index) {
            return buidlItem(controller.topUpChannels[index]);
          },
          // shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        );
      }),
    );
  }

  buidlItem(TopUpModel channel) {
    return ListTile(
      onTap: () {
        controller.openDepositChannel(channel);
      },

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      tileColor: Colors.white,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        clipBehavior: Clip.hardEdge,
        child: NetworkPicture(
          width: 36,
          height: 36,
          imageUrl: channel.logo,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        channel.name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
      trailing: const Icon(
        IconFont.arrow_right,
        size: 22,
        color: AppColors.primary,
      ),
    );
  }
}
