part of 'index.dart';

class WithdrawalView extends GetView<WithdrawalController> {
  const WithdrawalView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WithdrawalController>(
      init: WithdrawalController(),
      id: "withdrawal",
      builder: (_) {
        return WalletChannels(false);
      },
    );
  }
}
