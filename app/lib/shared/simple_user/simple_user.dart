import 'package:app/services/index.dart';
import 'package:app/shared/simple_user/auth_button.dart';
import 'package:app/shared/simple_user/simple_balance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SimpleUser extends StatelessWidget {
  const SimpleUser({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(child: Obx(() => services.auth.authorized ? SimpleBalance(depositable: true) : AuthButton()));
  }
}
