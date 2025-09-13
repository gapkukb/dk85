part of 'index.dart';

class _AuthService extends GetxService {
  final _tokenManager = authManager.obs;
  bool get authorized => _tokenManager.value.accessToken != null;
  bool get unauthorized => !authorized;
  bool get ensureUnauthorize => !ensureAuthorized;

  bool get ensureAuthorized {
    if (authorized) return true;
    Get.toNamed(Routes.auth);
    return false;
  }

  Future<bool> get ensureAuthorizedAsync async {
    if (authorized) return Future.value(true);
    await Get.toNamed(Routes.auth);
    return authorized;
  }

  Future _nextAction(String token) async {
    // 更新token
    try {
      _tokenManager.value.set(accessToken: token, refreshToken: token);
      authManager.set(accessToken: token, refreshToken: token);
      _tokenManager.refresh();
      storage.token.update(token);
      // 获取用户信息
      await services.user.queryUserInfo();
      services.user.queryBalance();
      // 修改认证状态
      // authorized.value = true;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future login(Object values) async {
    final t = await apis.user.login(data: values);
    await _nextAction(t.data.token);
  }

  Future register(Object values) async {
    final t = await apis.user.register(data: values);
    await _nextAction(t.data.token);
  }

  Future fastRegister() async {
    final t = await apis.user.fastRegister(payload: {'device_code': storage.deviceId.value});
    await _nextAction(t.data.token);
  }

  clear() {
    // 清空token和登录态
    _tokenManager.value.clear();
    _tokenManager.refresh();
    services.user.balance.value = 0;
    services.app.toDashboardView();
  }

  void logout() {
    // 调用退出接口，无需等待
    apis.user.logout();
    Timer(Duration(milliseconds: 1), clear);
  }

  @override
  void onInit() {
    final token = storage.token.value;
    if (token.isNotEmpty) {
      authManager.set(accessToken: token, refreshToken: token);
    }
    Future.delayed(Duration.zero).then((_) {
      Dialogs.to.onAuthChanged(authorized);
    });
    super.onInit();
  }
}
