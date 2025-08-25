import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AuthCotroller extends GetxController {
  final pwd = TextEditingController();
  final rememberMe = false.obs;

  remember(bool? value) {
    rememberMe.value = value ?? !rememberMe.value;
  }

  @override
  void dispose() {
    pwd.dispose();
    super.dispose();
  }
}
