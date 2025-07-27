part of 'index.dart';

class DepositView extends GetView<DepositController> {
  const DepositView({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(child: Text("DepositPage"));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DepositController>(
      init: DepositController(),
      id: "deposit",
      builder: (_) {
        return WalletChannels(true);
      },
    );
  }
}
