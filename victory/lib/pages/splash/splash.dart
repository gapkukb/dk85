import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:victory/constants/cs_url.dart';
import 'package:victory/helper/loading.dart';
import 'package:victory/helper/native_image.dart';
import 'package:victory/shared/app_info/app_info.dart';
import 'package:victory/theme/theme.dart';

class VicSplashPage extends StatelessWidget {
  final String? erorr;
  const VicSplashPage(this.erorr, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: BotToastInit(),
      home: Scaffold(
        floatingActionButton: TextButton(
          onPressed: () {
            launchUrl(Uri.parse(customerServiceUrl));
          },
          child: const Text('Customer Service', style: TextStyle(color: AppColors.highlight)),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(image: FileImage(File(NativeImage.splash)), fit: BoxFit.cover),
                // image: DecorationImage(image: AssetImage('assets/images/launch_background.webp'), fit: BoxFit.cover),
              ),
              child: VicLoading(
                style: erorr == null ? null : const TextStyle(color: AppColors.danger),
                text: erorr ?? 'Initializing...\nPlease wait',
              ),
            ),
            Positioned(
              bottom: 4,
              child: SafeArea(
                child: Text(
                  "Powered by:${VicAppInfo.shared.packageName}".toUpperCase(),
                  style: const TextStyle(fontSize: 12, color: Colors.black12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
