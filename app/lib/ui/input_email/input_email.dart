import 'package:get/get.dart';
import '../../constants/regexp.dart';
import '../input_base/input_base.dart';

class EmailInput extends AKBaseInput {
  final bool optional;
  EmailInput({super.key, super.onSaved, this.optional = false})
    : super(
        placeholder: "Your email address".tr,
        validator: (value) {
          if (value == null || value.isEmpty) {
            if (optional) return null;

            return "form.email.placed".tr;
          }

          if (!REGEXP_email.hasMatch(value)) return "form.email.error".tr;
          return null;
        },
      );
}
