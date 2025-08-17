import 'package:get/get.dart';
import '../routes/app_pages.dart';
import '../shared/token_manager/token_manager.dart';
import '/storage/index.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find();

  late final Rx<TokenManager> _tokenManager;

  String? get accessToken => _tokenManager.value.accessToken;
  String? get refreshToken => _tokenManager.value.refreshToken;
  bool get authenticated => _tokenManager.value.hasToken;

  @override
  void onInit() {
    final manager = TokenManager()..set(storage.token.value);
    _tokenManager = manager.obs;
    super.onInit();
  }

  void login() {
    _tokenManager.value.set('');
    final to = Get.parameters['then'];
    Get.offNamed(to ?? Routes.home);
  }

  void logout() {
    _tokenManager.value.clear();
  }
}
