import 'package:get/get.dart';

final class AuthLogic extends GetxController {
  static final AuthLogic shared = AuthLogic._internal();
  factory AuthLogic() => shared;
  AuthLogic._internal();
}
