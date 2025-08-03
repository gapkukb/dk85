import 'package:get/get.dart';
import '../../constants/regexp.dart';
import '../fields/base_field.dart';

class EmailInput extends BaseInput {
  final bool optional;
  EmailInput({super.key, super.onSaved, this.optional = false})
    : super(
        placeholder: "Your email address".tr,
        validator: (value) {
          if (value == null || value.isEmpty) {
            if (optional) return null;
            return "请填写您的邮箱地址";
          }

          if (!REGEXP_email.hasMatch(value)) return "您的邮箱地址格式有误";
          return null;
        },
      );
}
