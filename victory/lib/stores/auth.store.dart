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

  Future login(Object values) async {
    final t = await apis.auth.login(data: values);
    await _nextAction(t.token);
  }

  Future register(Object values) async {
    final t = await apis.auth.register(data: values);
    await _nextAction(t.token);
  }

  Future quickRegister(Object values) async {
    final t = await apis.auth.fastRegister(payload: {'device_code': storage.deviceId.value});
    await _nextAction(t.token);
  }

  Future logout() async {
    // 调用退出接口，无需等待
    apis.auth.logout();
    Timer(const Duration(milliseconds: 1), clear);
  }

  clear() {
    // 清空token和登录态
    tokenManager.value.clear();
    tokenManager.refresh();
    stores.user.balance.value = 0;
    stores.app.toHomePage();
  }

  Future ensureInitialized() async {}

  Future _nextAction(String token) async {
    // 更新token
    try {
      tokenManager.value.update(token, token);
      tokenManager.refresh();
      storage.token.update(token);
      // 获取用户信息
      await stores.user.queryUserInfo(updateBalance: true);
      // 修改认证状态
      // authorized.value = true;
    } catch (e) {
      Logger.error('获取用户信息和余额失败');
      rethrow;
    }
  }

  void toAuth() {
    Get.toNamed(AppRoutes.auth);
  }

  @override
  void onInit() {
    final token = storage.token.value;
    if (token.isNotEmpty) {
      tokenManager.value.update(token, token);
    }
    Future.delayed(Duration.zero).then((_) {
      // Dialogs.to.onAuthChanged(authorized);
    });
    super.onInit();
  }
}
