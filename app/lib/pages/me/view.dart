import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../iconfont/index.dart';
import '../../theme/index.dart';
import '../../ui/tile/index.dart';
import '/routes/app_pages.dart';
import 'index.dart';

class MePage extends GetView<MeController> {
  const MePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MeController>(
      builder: (_) {
        return SafeArea(
          child: Scaffold(
            // appBar: AppBar(title: const Text("data")),
            body: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: [
                const SizedBox(height: 44),
                buildBalance(),
                AkTileGroup(
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  children: [
                    AkTile(showArrow: true, titleText: "page.account".tr, to: Routes.SETTINGS),
                    AkTile(showArrow: true, titleText: "page.account".tr, to: Routes.SETTINGS),
                    AkTile(showArrow: true, titleText: "page.vip".tr, to: Routes.CASINO),
                    AkTile(showArrow: true, titleText: "page.favorites".tr, to: Routes.FAVORITES),
                    AkTile(showArrow: true, titleText: "page.invitation".tr, to: Routes.CASINO),
                    AkTile(showArrow: true, titleText: "page.service".tr, to: Routes.CUSTOMER_SERVICE),
                    AkTile(showArrow: true, titleText: "page.messages".tr, to: Routes.INBOX),
                    AkTile(showArrow: true, titleText: "page.more".tr, to: Routes.MORE),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  buildBalance() {
    return Container(
      // height: 116,
      // margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        image: const DecorationImage(image: AssetImage("assets/images/balance-bg.png"), fit: BoxFit.fitWidth, alignment: Alignment(0.5, 0)),
        gradient: RadialGradient(colors: [AppColors.primary.withAlpha(50), AppColors.primary], radius: 1.6, center: const Alignment(-0.5, -3)),
      ),
      child: DefaultTextStyle(
        style: const TextStyle(color: Colors.white),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 8,
              children: [
                const SizedBox(height: 24),
                Text(
                  "app.balance".tr,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "700000",
                        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: " MMK", style: TextStyle(fontSize: 24)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: Row(
                    spacing: 16,
                    children: [
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: SizedBox(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text("app.deposit".tr, style: const TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.white)),
                          child: Text(
                            "app.deposit".tr,
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      // ElevatedButton(onPressed: () {}, child: Text("app.withdraw".tr)),
                    ],
                  ),
                ),
              ],
            ),
            const Positioned(right: 12, top: 12, child: Icon(IconFont.refresh, color: Colors.white)),
            Positioned(
              left: 12,
              top: -44,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ClipOval(child: Image.asset("assets/images/logo2.webp", width: 60, height: 60)),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: const BoxDecoration(color: Color(0xfffffac4), borderRadius: BorderRadius.all(Radius.circular(100))),
                    child: const Text(
                      "VIP1",
                      style: TextStyle(fontSize: 12, color: AppColors.primary, fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
