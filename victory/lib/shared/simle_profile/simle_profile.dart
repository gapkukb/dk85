import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import '../../components/button/button.dart';
import '../../services/services.dart';

class SimleProfile extends StatelessWidget {
  const SimleProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => services.auth.authorized ? const Text('ssss') : authButton,
    );
  }

  Widget get authButton {
    return VicButton(
      rounded: true,
      height: 36,
      textBold: true,
      text: 'SIGN IN | SIGN UP',
      onPressed: () {
        services.auth.login();
      },
    );
  }
}
