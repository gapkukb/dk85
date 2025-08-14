import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/index.dart';
import '../../../ui/fields/base_field.dart';
import '../../../widgets/network_picture.dart';
import '../../../widgets/service_calling.dart';
import '../controller.dart';

class DepositBill extends GetView<DepositController> {
  const DepositBill({super.key});

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("app.transcation.detail".tr, style: AppText.title),
              const ServiceCalling(),
            ],
          ),
          const SizedBox(),
          Text("payment.method".tr, style: AppText.label),
          buildMethod(),
          const SizedBox(),
          Text("payment.amount".tr, style: AppText.label),
          buildAmount(),
          const SizedBox(),
          BaseInput(
            controller: controller.amountCtrl,
            maxLength: 11,
            placeholder: "payment.limit".tr,
            keyboardType: TextInputType.number,
            suffix: const Text("MMK", style: TextStyle(height: 1)),
            onSaved: (value) {},
            validator: (value) {
              return null;
            },
          ),
          const Spacer(),
          MaterialButton(onPressed: () {}, color: AppColors.primary, height: 48, textColor: Colors.white, child: Text("app.deposit".tr)),
        ],
      ),
    );
  }

  GridView buildAmount() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisExtent: 44, crossAxisSpacing: 8, mainAxisSpacing: 8),
      itemCount: controller.presets.length,
      itemBuilder: (BuildContext context, int index) {
        final n = controller.presets[index].toString();
        return Obx(
          () => _Button(
            onPressed: () {
              controller.setAmount(n);
            },
            text: n,
            selected: controller.amount.value == n,
          ),
        );
      },
    );
  }

  Container buildMethod() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: AppColors.background, borderRadius: BorderRadius.circular(4)),
      child: Row(
        spacing: 8,
        children: [
          NetworkPicture(imageUrl: 'https://imgcdn.knryywqf.com/upload/images/202501/34989806-89dd-4b1f-9609-ee0e7541614e.jpg', width: 32, height: 32),
          const Text("KBZpay", style: AppText.normal),
          DecoratedBox(
            decoration: BoxDecoration(color: AppColors.warn, borderRadius: BorderRadius.circular(4)),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              child: Text("အများဆုံးလက်ဆောင်2500", style: TextStyle(height: 1, color: Colors.white, fontSize: 9)),
            ),
          ),
        ],
      ),
    );
  }
}

class _Button extends OutlinedButton {
  final String text;
  final bool selected;
  _Button({required super.onPressed, required this.text, this.selected = false})
    : super(
        style: OutlinedButton.styleFrom(
          backgroundColor: selected ? AppColors.primary : null,
          side: BorderSide(color: selected ? AppColors.primary : AppColors.border, width: 1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: Text(text, style: AppText.title.copyWith(color: selected ? Colors.white : null)),
      );
}
