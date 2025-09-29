import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:victory/apis/apis.dart';
import 'package:victory/constants/lucky_spin.dart';
import 'package:victory/extensions/currency.extension.dart';
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
  bool get done => prizeAmount != 0.0;
  @override
  Widget build(BuildContext context) {
    return VicModalTemplate(
      padding: const EdgeInsets.all(0),
      margin: 0,
      backgroundColor: Colors.transparent,
      title: 'Congratulations',
      // subtitle: 'The more you charge, the more you get',
      buttoText: done ? 'Close' : 'Got it',
      onButtonTap: () async {
        if (done) {
          Get.back();
          services.user.updateBalance();
          services.user.queryLuckySpin();
        } else {
          claim();
        }
      },
      onBeforeClose: () async {
        if (!done) {
          // services.user.queryLuckySpin();
          services.user.luckySpinDisplay.value = LuckySpinDisplay.miniPending;
          Get.back();
        }
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
        child: done
            ? Text(
                prizeAmount.amount(),
                style: const TextStyle(fontSize: 48, color: Color(0xfffff957), fontWeight: FontWeight.bold),
              )
            : const Text(
                "Congratulations",
                style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
              ),
      ),
    );
  }

  void claim() async {
    try {
      final r = await apis.user.claimLuckySpin(
        payload: {
          "activity_id": services.user.luckySpinActiveId,
          "participate_id": services.user.luckySpinParticipateId,
        },
      );
      if (r == null) return;
      prizeAmount = r.priceAmount.toDouble();
      services.user.updateBalance();
      setState(() {});
    } on DioException catch (e) {
      if (e.response?.data is Map && e.response!.data['code'] == 1001) {
        VicDialog.luckyspin(
          title: 'You can get rewards\n after recharging',
          onTap: () {
            Get.back();
            services.app.toFundsPage();
          },
        );
      } else if (e.message != null) {
        VicDialog.luckyspin(
          title: e.message ?? '',
          onTap: Get.back,
        );
      } else {
        rethrow;
      }
    }
  }
}
