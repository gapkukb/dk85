import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:victory/apis/apis.dart';
import 'package:victory/modals/views/modal_template.dart';
import 'package:victory/services/services.dart';
import 'package:victory/shared/dialogs/dialog.dart';

class VicModalLuckySpinNext extends StatefulWidget {
  const VicModalLuckySpinNext({super.key});

  @override
  State<VicModalLuckySpinNext> createState() => _VicModalLuckySpinNextState();
}

class _VicModalLuckySpinNextState extends State<VicModalLuckySpinNext> {
  double prizeAmount = 0.0;
  @override
  Widget build(BuildContext context) {
    return VicModalTemplate(
      padding: const EdgeInsets.all(0),
      margin: 0,
      backgroundColor: Colors.transparent,
      title: 'Congratulations',
      // subtitle: 'The more you charge, the more you get',
      buttoText: 'Got it',
      onButtonTap: () async {
        final r = await apis.user.claimLuckySpin(
          payload: {
            "activity_id": services.user.lotteryActiveId.value,
            "participate_id": services.user.lotteryParticipateId.value,
          },
        );
        prizeAmount = r.priceAmount.toDouble();
        setState(() {});
      },
      onBeforeClose: () async {
        services.user.showLotteryPendant.value = true;
        Get.back();
      },
      child: Container(
        alignment: const Alignment(0, 0.1),
        width: double.infinity,
        height: 360,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/fu_dai.webp'),
            scale: 1.9,
          ),
        ),
        foregroundDecoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/jin_bi.webp'),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: prizeAmount == 0.0
            ? const Text(
                "Congratulations",
                style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
              )
            : const Text(
                "5.22K",
                style: TextStyle(fontSize: 48, color: Color(0xfffff957), fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}
