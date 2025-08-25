import 'package:app/routes/app_pages.dart';
import 'package:app/shared/webview/webview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GamingView extends StatelessWidget {
  static void play([Map<String, String>? config]) {
    Get.toNamed(Routes.gaming, parameters: config);
  }

  const GamingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Webview(
      url:
          "https://allcdn.dvdfh.com/sea/client/pro/h5/fortuneTigerAD/index.html?moneySign=Ks&language=hi",
    );
  }
}
