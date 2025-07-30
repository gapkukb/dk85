import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/index.dart';
import '../../../widgets/base_input.dart';
import '../../../widgets/service_calling.dart';
import '../controller.dart';

class WithdrawaltBill extends GetView<WithdrawalController> {
  const WithdrawaltBill({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 500,
      padding: const EdgeInsets.all(16),
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // mainAxisAlignment: MainAxisAlignment.,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("WAVEPAY", style: AppText.title),
              ServiceCalling(),
            ],
          ),
          const SizedBox(),
          const Text("收款账号", style: AppText.label),
          BaseInput(
            placeholder: "输入收款账号",
            keyboardType: TextInputType.number,
            onSaved: (value) {},
            validator: (value) {
              return null;
            },
          ),
          const SizedBox(),
          const Text("提款金额", style: AppText.label),
          BaseInput(
            maxLength: 11,
            placeholder: "请输入提款金额",
            keyboardType: TextInputType.number,
            suffix: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 8,
              children: [
                const Text("MMK", style: TextStyle(height: 3)),
                MaterialButton(
                  minWidth: 56,
                  height: 32,
                  color: AppColors.warn,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(28),
                  ),
                  onPressed: () {},
                  child: Text(
                    "全部",
                    style: AppText.mini.copyWith(
                      color: Colors.white,
                      height: 1,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
              ],
            ),

            onSaved: (value) {},
            validator: (value) {
              return null;
            },
          ),
          const Spacer(),
          CupertinoButton.filled(
            borderRadius: BorderRadius.circular(4),
            sizeStyle: CupertinoButtonSize.medium,
            color: AppColors.danger,
            child: const Text("下一步"),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
