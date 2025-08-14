part of 'index.dart';

class WithdrawalAccountView extends GetView<WithdrawalAccountController> {
  const WithdrawalAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 14, color: AppColors.title);
    return Scaffold(
      appBar: AppBar(
        title: Text("withdraw.acc.title".tr),
        titleTextStyle: const TextStyle(fontSize: 16, color: AppColors.title, fontWeight: FontWeight.bold),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(12),
          children: [
            ListTile(title: Text("withdraw.acc.add".tr), titleTextStyle: style),
            const SizedBox(height: 8),
            ListTile(
              title: Text("${"withdraw.acc.list".tr}(0)"),
              titleTextStyle: style,
              trailing: IconButton(onPressed: () {}, icon: const Icon(IconFont.refresh), iconSize: 16),
              contentPadding: const EdgeInsets.only(left: 16),
            ),
          ],
        ),
      ),
    );
  }
}
