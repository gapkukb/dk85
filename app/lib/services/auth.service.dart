part of 'index.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find();
  final _tokenManager = tokenManager.obs;

  bool get authorized => _tokenManager.value.accessToken != null;
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

  Future _next(String token) async {
    // 更新token
    _tokenManager.value.set(accessToken: token, refreshToken: token);
    _tokenManager.refresh();
    // 获取用户信息
    await UserService.to.queryUserInfo();
    UserService.to.queryBalance();
    // 修改认证状态
    // authorized.value = true;
  }

  Future login(Object values) async {
    final t = await loginApi(payload: values);
    await _next(t.token);
  }

  Future register(Object values) async {
    final t = await registerApi(payload: values);
    await _next(t.token);
  }

  Future logout() async {
    // 调用退出接口，无需等待
    logoutApi();
    // 清空token和登录态
    _tokenManager.value.clear();
    _tokenManager.refresh();
    // 清空路由栈并返回主页
    Get.reset();
    AppService.to.toHomeView();
    Get.reset();
  }
}
