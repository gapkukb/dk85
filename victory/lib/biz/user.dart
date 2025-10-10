import 'package:get/get.dart';

final class UserLogic extends GetxController {
  static final UserLogic shared = UserLogic._internal();
  factory UserLogic() => shared;
  UserLogic._internal();
}
