import '/pages/funds/widgets/wallet_channels.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class WithdrawalView extends GetView<WithdrawalController> {
  const WithdrawalView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WithdrawalController>(
      init: Get.put(WithdrawalController()),
      builder: (_) {
        return WalletChannels(true, onTap: (index) {});
      },
    );
  }
}
