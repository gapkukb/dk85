part of 'index.dart';

class UserService extends GetxService {
  static UserService get to => Get.find();

  final balance = RxNum(0);
  final userInfo = Rxn<UserModel>();
  final token = storage.token;

  Future queryUserInfo() async {
    final r = await queryUserInfoApi();
    userInfo.value = r.data;
    userInfo.refresh();
  }

  Future queryBalance() async {
    final b = await queryBalanceApi();
    balance.value = b.data.balance;
  }

  @override
  void onInit() {
    if (AuthService.to.authorized) {
      queryUserInfo();
    }
    super.onInit();
  }
}
