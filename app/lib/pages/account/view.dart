part of 'index.dart';

class AccountView extends GetView<AccountController> {
  const AccountView({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("AccountPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountController>(
      init: AccountController(),
      id: "account",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("Account")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
