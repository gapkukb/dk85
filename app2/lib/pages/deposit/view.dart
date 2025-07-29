import '/pages/funds/widgets/wallet_channels.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/bill.dart';

class DepositView extends GetView<DepositController> {
  const DepositView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DepositController>(
      init: Get.put(DepositController()),
      builder: (_) {
        return WalletChannels(
          false,
          onTap: (index) {
            Get.bottomSheet(DepositBill(), isScrollControlled: true);
          },
        );
      },
    );
  }
}
