import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/network_image/network_image.dart';
import '../../../iconfont/iconfont.dart';
import '../../../models/models.dart';
import '../../../theme/colors.dart';
import '../controller.dart';

class VicDepositChannels extends GetView<FundsController> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.background,
      child: Obx(() {
        return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          itemCount: controller.channelsDeposit.length,
          separatorBuilder: (context, index) {
            return const SizedBox(height: 12);
          },
          itemBuilder: (context, index) {
            return buidlItem(controller.channelsDeposit[index]);
          },
          // shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        );
      }),
    );
  }

  buidlItem(VicDepositChannelModel channel) {
    return ListTile(
      onTap: () {
        controller.openDepositChannel(channel);
      },

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      tileColor: Colors.white,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        clipBehavior: Clip.hardEdge,
        child: VicNetworkImage(
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
