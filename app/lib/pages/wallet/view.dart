part of 'index.dart';

class WalletView extends GetView<WalletController> {
  const WalletView({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("WalletPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WalletController>(
      init: WalletController(),
      id: "wallet",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("Wallet")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
