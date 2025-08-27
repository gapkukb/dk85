part of 'index.dart';

class UserService extends GetxService {
  static UserService get to => Get.find();

  final balance = 0.0.obs;
  final userInfo = storage.user;
  final token = storage.token;

  bool get authenticated => token.value.isNotEmpty;

  updateUserInfo() {
    userInfo.value = {};
  }

  tokenManager() {}

  logout() {
    userInfo.value = {};
  }

  Future initlizeUser() async {
    quickRegister();
  }
}
