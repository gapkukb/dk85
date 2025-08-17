import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/index.dart';
import '../../../ui/button/index.dart';
import '../../../ui/input_base/input_base.dart';
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
          Text("withdraw.account".tr, style: AppText.label),
          AKBaseInput(
            placeholder: "withdraw.account.add".tr,
            keyboardType: TextInputType.number,
            onSaved: (value) {},
            validator: (value) {
              return null;
            },
          ),
          Text("withdraw.amount".tr, style: AppText.label.copyWith(height: 1)),
          Text("withdraw.amount.mark".tr, style: const TextStyle(color: AppColors.primary, fontSize: 12, height: 1)),
          AKBaseInput(
            maxLength: 11,
            placeholder: "withdraw.amount.placeholder".tr,
            keyboardType: TextInputType.number,
            suffixIconConstraints: const BoxConstraints(
              minWidth: 0, // Custom minimum width
              minHeight: 0, // Custom minimum height
            ),
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 8,
              children: [
                const Text("MMK", style: TextStyle(height: 1, fontSize: 12)),
                MaterialButton(
                  enableFeedback: false,
                  highlightElevation: 0,
                  padding: const EdgeInsets.all(0),
                  minWidth: 56,
                  height: 28,
                  color: AppColors.warn,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(28)),
                  onPressed: () {},
                  child: Text("app.all".tr, style: AppText.mini.copyWith(color: Colors.white, height: 1)),
                ),
                // const SizedBox(width: 4),
              ],
            ),

            onSaved: (value) {},
            validator: (value) {
              return null;
            },
          ),
          buildRichText("withdraw.amount.able".tr, 0),
          const SizedBox(),
          buildRichText("withdraw.amount.min".tr, 3000),
          const Spacer(),
          AKButton(onPressed: () {}, height: 48, color: AppColors.primary, textColor: Colors.white, text: "withdraw.button".tr),
        ],
      ),
    );
  }

  buildRichText(String title, num amount) {
    return Text.rich(
      style: const TextStyle(fontSize: 12),
      TextSpan(
        children: [
          TextSpan(text: title),
          TextSpan(
            text: "$amount",
            style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.primary),
          ),
          const TextSpan(text: " MMK", style: TextStyle()),
        ],
      ),
    );
  }
}
