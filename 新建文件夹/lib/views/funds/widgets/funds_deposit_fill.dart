import 'package:app/iconfont/index.dart';
import 'package:app/shared/customer_service/customer_service.dart';
import 'package:app/theme/index.dart';
import 'package:app/views/funds/funds_controller.dart';
import 'package:app/views/funds/widgets/funds_preset_amount.dart';
import 'package:app/widgets/button/index.dart';
import 'package:app/widgets/input_base/input_base.dart';
import 'package:app/widgets/network_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class FundsDepositFill extends GetView<FundsController> {
  const FundsDepositFill({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildContent(),
          AKButton(
            gradient: null,
            text: 'app.deposit'.tr,
            radius: 0,
            onPressed: controller.deposit,
          ),
        ],
      ),
    );
  }

  Widget buildContent() {
    return Container(
      constraints: BoxConstraints(maxHeight: Get.height / 1.2),
      padding: EdgeInsets.only(left: 12, right: 12, top: 12),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "payment.receiver.title".tr,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                CustomerServiceTrigger(),
              ],
            ),
            Text(
              "payment.method".tr,
              style: TextStyle(fontSize: 12, color: AppColors.description),
            ),

            buildChannel(),

            SizedBox(height: 8),

            Text(
              "payment.amount".tr,
              style: TextStyle(fontSize: 12, color: AppColors.description),
            ),

            FundsPresetAmount(),

            SizedBox(height: 8),

            AKBaseInput(
              controller: controller.ctrl,
              maxLength: 11,
              placeholder: "payment.limit".tr,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              suffix: const Text("MMK", style: TextStyle(height: 1)),
              onSaved: (value) {},
              validator: (value) {
                return null;
              },
            ),

            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget buildTitle(String title, String? text) {
    final ret = Text(
      title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    );

    if (text == null) return ret;
    return Row(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [ret, buildDescription(text)],
    );
  }

  Widget buildDescription(String text) {
    return ColoredBox(
      color: AppColors.ff8240,
      child: Text(
        " $text ",
        style: TextStyle(fontSize: 8, color: AppColors.white),
      ),
    );
  }

  Widget buildChannel() {
    return Stack(
      children: [
        ListTile(
          tileColor: AppColors.ffeee5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(8),
            side: BorderSide(color: AppColors.primary),
          ),
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
          title: buildTitle('title', 'text'),
        ),
        Positioned(
          right: 8,
          top: 8,
          child: Icon(IconFont.selected, color: AppColors.primary),
        ),
      ],
    );
  }
}
