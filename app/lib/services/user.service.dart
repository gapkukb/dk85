part of 'index.dart';

class UserService extends GetxService {
  static UserService get to => Get.find();

  final balance = 0.0.obs;
  final userInfo = Rxn<UserInfoModel>();
  final token = storage.token;

  bool get authenticated => token.value.isNotEmpty;

  Future queryUserInfo() async {
    // userInfo.value = await queryUserInfoApi();
    // userInfo.refresh();
  }

  Future queryBalance() async {
    final b = await queryBalanceApi();
    balance.value = b.balance;
  }

  @override
  void onInit() {
    if (AuthService.to.authorized) {
      userInfo.value = UserInfoModel.fromJson(storage.user.value ?? {});
    }
    super.onInit();
  }
}
