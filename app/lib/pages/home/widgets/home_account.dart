import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../iconfont/index.dart';
import '../../../theme/index.dart';
import '../../../widgets/Balance.dart';

class HomeAccount extends StatelessWidget {
  const HomeAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        height: 36,
        padding: const EdgeInsets.all(2),
        decoration: const BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.all(Radius.circular(100))),
        child: Row(
          spacing: 8,
          children: [
            const CircleAvatar(radius: 16, foregroundImage: AssetImage("assets/images/logo3.webp")),
            buildUser(),
            buildButton(),
          ],
        ),
      ),
    );
  }

  buildUser() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          spacing: 4,
          children: [
            const Text("ID:123456", style: TextStyle(fontSize: 10, color: Colors.white)),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(color: const Color(0xfffffac4), borderRadius: BorderRadius.circular(16)),
              child: const Text(
                "VIP1",
                style: TextStyle(fontSize: 8, color: AppColors.primary, height: 1.2, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        buildBalance(),
      ],
    );
  }

  buildBalance() {
    return Balance(
      child: const Icon(IconFont.refresh, size: 14, color: Colors.white),
      builder: (amount, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 4,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              3000.toString(),
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            child,
          ],
        );
      },
    );
  }

  buildButton() {
    return MaterialButton(
      elevation: 0,
      highlightElevation: 0,
      onPressed: () {},
      minWidth: 78,
      height: 32,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      color: const Color(0xffffeddd),
      child: Text(
        "app.deposit".tr,
        style: const TextStyle(fontSize: 12, color: AppColors.primary, fontWeight: FontWeight.bold),
      ),
    );
  }
}
