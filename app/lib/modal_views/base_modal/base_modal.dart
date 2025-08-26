import 'package:app/iconfont/index.dart';
import 'package:app/theme/index.dart';
import 'package:app/widgets/button/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';

class BaseModal extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onPressed;
  final double imageHeight;

  const BaseModal({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onPressed,
    required this.imageHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            alignment: AlignmentGeometry.topCenter,
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: Get.back,
                icon: Icon(IconFont.guanbi, size: 36, color: AppColors.white),
              ),
            ),
            SizedBox(height: imageHeight),
            Text(
              title,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              subtitle,
              style: TextStyle(fontSize: 14, color: AppColors.white, height: 1),
            ),
            const SizedBox(height: 16),
            AKButton(
              minWidth: Get.width / 1.7,
              radius: 100,
              color: AppColors.ff8240,
              height: 36,
              onPressed: () {
                Get.back();
                onPressed();
              },
              child: Text(buttonText),
            ),
          ],
        ),
      ),
    );
  }
}
