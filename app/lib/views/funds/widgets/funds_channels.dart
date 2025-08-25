import 'package:flutter/material.dart';
import 'package:app/views/funds/funds_controller.dart';
import 'package:get/get.dart';
import '/iconfont/index.dart';
import '/theme/index.dart';
import '/widgets/network_picture.dart';

class FundsChannels extends GetView<FundsController> {
  final bool isWidthrawal;
  const FundsChannels(this.isWidthrawal, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.background,
      child: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: 2,
        separatorBuilder: (context, index) {
          return const SizedBox(height: 16);
        },
        itemBuilder: (context, index) {
          return buidlItem(1);
        },
        // shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }

  buidlItem(int index) {
    return ListTile(
      onTap: () {
        isWidthrawal
            ? controller.openWithdrawChannel(index)
            : controller.openDepositChannel(index);
      },

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      tileColor: Colors.white,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        clipBehavior: Clip.hardEdge,
        child: NetworkPicture(
          width: 36,
          height: 36,
          imageUrl:
              "https://imgcdn.knryywqf.com/upload/images/202501/34989806-89dd-4b1f-9609-ee0e7541614e.jpg",
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        isWidthrawal ? "Mrs. Akeem Kshlerin" : "Ms. Piper Wyman",
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
