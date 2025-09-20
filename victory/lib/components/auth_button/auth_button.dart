import 'package:flutter/material.dart';
import '../../styles/styles.dart';
import '../button/button.dart';

class VicAuthButton extends StatelessWidget {
  const VicAuthButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const VicButton(
      height: 36,
      text: 'SIGN IN|SIFGN UP',
      backgroundColor: AppColor.background,
    );
  }
}
