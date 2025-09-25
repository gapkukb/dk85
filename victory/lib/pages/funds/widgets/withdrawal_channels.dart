import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:victory/components/network_image/network_image.dart';
import 'package:victory/iconfont/iconfont.dart';
import 'package:victory/models/models.dart';
import 'package:victory/theme/colors.dart';
import 'package:victory/pages/funds/index.dart';

class VicWithdrawalChannels extends GetView<FundsController> {
  const VicWithdrawalChannels({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.background,
      child: Obx(() {
        return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          itemCount: controller.channelsWithdrawal.length,
          separatorBuilder: (context, index) {
            return const SizedBox(height: 12);
          },
          itemBuilder: (context, index) {
            return buidlItem(controller.channelsWithdrawal[index]);
          },
          // shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        );
      }),
    );
  }

  buidlItem(VicWithdrawalChannelModel channel) {
    return ListTile(
      onTap: () {
        controller.openWithdrawChannel(channel);
      },

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      tileColor: Colors.white,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        clipBehavior: Clip.hardEdge,
        child: VicNetworkImage(width: 36, height: 36, imageUrl: channel.logo, fit: BoxFit.cover),
      ),
      title: Text(
        channel.name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
      trailing: const Icon(IconFont.arrow_right, size: 22, color: AppColors.primary),
    );
  }
}
