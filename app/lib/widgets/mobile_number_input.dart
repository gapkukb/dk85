import 'package:app/widgets/base_input.dart';
import 'package:flutter/cupertino.dart';

class MobileNumberInput extends StatelessWidget {
  const MobileNumberInput({super.key});
  @override
  Widget build(BuildContext context) {
    return BaseInput(
      placeholder: "请输入你的账号",
      onSaved: (value) {},
      validator: (value) {
        return null;
      },
    );
  }
}
