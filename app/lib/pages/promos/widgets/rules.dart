import 'package:flutter/material.dart';

class Rules extends StatelessWidget {
  const Rules({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 16),
          Text("🎁登录即享丰厚奖励🎁"),
          Text("每日登录，随机奖励"),
          Text("每日登录，即享"),
          Text("加入即有机会获得9999999金币奖励"),
        ],
      ),
    );
  }
}
