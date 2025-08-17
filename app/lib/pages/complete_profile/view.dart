import 'package:flutter/material.dart';

import '../../hooks/useForm.dart';
import '../../theme/index.dart';
import '../../ui/button/index.dart';
import '../../ui/input_email/input_email.dart';
import '../../ui/gutter/index.dart';
import '../../ui/input_mobile/input_mobile.dart';

class CompeleteProfileView extends StatefulWidget {
  const CompeleteProfileView({super.key});

  @override
  _CompeleteProfileViewState createState() => _CompeleteProfileViewState();
}

class _CompeleteProfileViewState extends State<CompeleteProfileView> {
  final form = Useform((values) {});
  @override
  Widget build(BuildContext context) {
    return Form(
      key: form.key,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "完善资料",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Gutter.large,
                AKMobileInput(onSaved: form.saveAs("mobile")),
                EmailInput(onSaved: form.saveAs("email")),
                Gutter.xlarge,
                AKButton(onPressed: () {}, text: "完成并获得58MMK好礼", color: AppColors.primary),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
