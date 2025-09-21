part of 'stores.dart';

final globalTokenManager = TokenManager();

class _AuthService extends GetxService {
  final tokenManager = globalTokenManager.obs;
  bool get authorized => tokenManager.value.accessToken != null;
  bool get unauthorized => !authorized;
  bool get ensureUnauthorize => !ensureAuthorized;

  bool get ensureAuthorized {
    if (authorized) return true;
    Get.toNamed(AppRoutes.auth);
    return false;
  }

  Future<bool> get ensureAuthorizedAsync async {
    if (authorized) return Future.value(true);
    await Get.toNamed(AppRoutes.auth);
    return authorized;
  }

  Future autoLogin() async {}
  Future login() async {
    tokenManager.value.update('accessToken', 'refreshToken');
    tokenManager.refresh();
  }

  Future register() async {}
  Future quickRegister() async {}
  Future logout() async {}
  Future initialize() async {}
}
