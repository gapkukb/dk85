import '../../../iconfont/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

class CheckInWidget extends GetView<PromosController> {
  const CheckInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xffff5800).withAlpha(100),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("每日签到", style: TextStyle(fontWeight: FontWeight.bold)),
              IconButton(
                onPressed: () {
                  Get.bottomSheet(
                    Container(
                      padding: const EdgeInsets.all(16),
                      width: double.infinity,
                      height: 400,
                      decoration: const BoxDecoration(color: Colors.white),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              "规则",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          Text("🎁登录即享丰厚奖励🎁"),
                          Text("每日登录，随机奖励"),
                          Text("每日登录，即享"),
                          Text("加入即有机会获得9999999金币奖励"),
                        ],
                      ),
                    ),
                  );
                },
                icon: const Icon(IconFont.gantanhao1, color: Colors.red),
              ),
            ],
          ),
          SizedBox(
            height: 60,
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return const SizedBox(width: 4);
              },
              scrollDirection: Axis.horizontal,
              itemCount: 31,
              itemBuilder: (context, index) {
                return const _CheckInItem(
                  date: "31",
                  status: 1,
                  selected: true,
                );
              },
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 40,
            child: CupertinoButton.filled(
              sizeStyle: CupertinoButtonSize.small,

              child: const Text("签到"),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class _CheckInItem extends StatelessWidget {
  final String date;
  final int status;
  final bool selected;

  const _CheckInItem({
    super.key,
    required this.date,
    required this.status,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 60,
      decoration: BoxDecoration(
        color: selected ? const Color(0xffff5800) : const Color(0xfff5f5f5),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 4,
        children: [
          Image.asset("assets/images/1.webp", height: 24, width: 24),
          Text(
            "31 Jul",
            style: TextStyle(
              fontSize: 11,
              color: selected ? Colors.white : const Color(0xff666666),
            ),
          ),
        ],
      ),
    );
  }
}
