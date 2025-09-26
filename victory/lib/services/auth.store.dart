part of 'services.dart';

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

  Future login(Object values) async {
    final t = await apis.auth.login(data: values);
    _saveAndUpdate(t.token);
  }

  Future register(Object values) async {
    final t = await apis.auth.register(data: values);
    _saveAndUpdate(t.token);
  }

  Future quickRegister() async {
    Logger.debug('使用设备号注册:${VicAppInfo.shared.deviceId}');
    final t = await apis.auth.fastRegister(payload: {'device_code': VicAppInfo.shared.deviceId});
    Logger.debug('设备号注册成功');
    _saveAndUpdate(t.token);
  }

  Future logout() async {
    if (services.user.mobile.isEmpty) {
      try {
        // 用户绑定了手机执行真实退出流程
        await apis.auth.logout(options: Options(receiveTimeout: const Duration(seconds: 3)));
        storage.token.clear();
      } catch (e) {
        rethrow;
      }
    }
    tokenManager.value.clear();
    tokenManager.refresh();
    services.app.toHomePage();
  }

  Future ensureInitialized() async {
    try {
      if (unauthorized) return quickRegister();
    } catch (e) {
      Logger.error('设备号注册失败，进入游客模式...................');
    }
  }

  void toAuth() {
    Get.toNamed(AppRoutes.auth);
  }

  Worker listen(Function(bool authorized) listener) {
    listener(authorized);
    return ever(tokenManager, (_) => listener(authorized));
  }

  @override
  void onInit() {
    final token = storage.token.value;
    if (token.isNotEmpty) {
      Logger.debug('token已存在，直接登录:$token');
      tokenManager.value.update(token, token);
    } else {
      Logger.debug('token未存在，执行设备号注册');
    }
    super.onInit();
  }

  _saveAndUpdate(String token) {
    // 更新token
    tokenManager.value.update(token, token);
    tokenManager.refresh();
    storage.token.update(token);
  }
}
