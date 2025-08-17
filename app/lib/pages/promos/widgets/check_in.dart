import '../../../iconfont/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/index.dart';
import '../../../ui/button/index.dart';
import '../index.dart';
import 'rules.dart';

class CheckInWidget extends GetView<PromosController> {
  const CheckInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // 已过期
    const AssetImage expiredIcon = AssetImage("assets/images/coin-0.webp");
    // 已签到，可签到
    const AssetImage checkableIcon = AssetImage("assets/images/coin-1.webp");
    // 不可签到
    const AssetImage uncheckableIcon = AssetImage("assets/images/coin-2.webp");

    final Map<num, _Configuration> iconMaper = {
      0: const _Configuration(icon: checkableIcon, bgcolor: AppColors.primary, color: Colors.white),
      1: _Configuration(icon: checkableIcon, bgcolor: const Color(0xffffbd99), color: AppColors.primary.withAlpha(200)),
      2: const _Configuration(icon: expiredIcon, bgcolor: Color(0xffffdecc), color: Color(0xffCC8864)),
      3: _Configuration(icon: uncheckableIcon, bgcolor: AppColors.primary.withAlpha(26), color: AppColors.primary),
    };

    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("checkin.title".tr, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              Transform.translate(
                offset: const Offset(12, 0),
                child: IconButton(
                  icon: const Icon(IconFont.gantanhao1, color: Colors.red),
                  onPressed: () {
                    Get.bottomSheet(const Rules());
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 60,
            child: SingleChildScrollView(
              controller: controller.listCtrl,
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 4,
                children: controller.dates.value.map((item) {
                  return _CheckInItem(key: item.status == 0 ? controller.todayKey : null, date: item.date, status: item.status, config: iconMaper[item.status]!);
                }).toList(),
              ),
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 40,
            child: AKButton(text: "checkin.do".tr, color: AppColors.primary, onPressed: controller.checkin),
          ),
        ],
      ),
    );
  }
}

class _CheckInItem extends StatelessWidget {
  final String date;
  final int status;
  final _Configuration config;

  const _CheckInItem({super.key, required this.date, required this.status, required this.config});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 43,
      height: 60,
      decoration: BoxDecoration(color: config.bgcolor, borderRadius: BorderRadius.circular(4)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 4,
        children: [
          Image(image: config.icon, height: 32, width: 32),
          Text(date.substring(4), softWrap: false, style: TextStyle(fontSize: 10, color: config.color)),
        ],
      ),
    );
  }
}

class _Configuration {
  final AssetImage icon;
  final Color bgcolor;
  final Color color;

  const _Configuration({required this.icon, required this.bgcolor, required this.color});
}
