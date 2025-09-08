import 'package:app/routes/app_pages.dart';
import 'package:app/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 36,
      highlightElevation: 0,
      color: AppColors.primary,
      elevation: 0,
      shape: StadiumBorder(),
      child: Text("SIGN UP | LOG IN", style: TextStyle(color: Colors.white)),
      onPressed: () {
        Get.toNamed(Routes.auth);
      },
    );
  }
}
