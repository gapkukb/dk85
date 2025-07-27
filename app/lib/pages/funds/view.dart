part of 'index.dart';

class FundsView extends GetView<FundsController> {
  const FundsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FundsController>(
      init: FundsController(),
      id: "funds",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Account Withdrawal"),
            automaticallyImplyLeading: true,
            centerTitle: true,
            // actionsPadding: EdgeInsets.only(right: 16),
            actions: [
              CustomerServiceButton(),
              IconButton(
                onPressed: () {},
                icon: Icon(IconFont.tianjia, color: AppColor.main),
              ),
            ],
          ),
          body: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemCount: 4,
            separatorBuilder: (context, index) => SizedBox(height: 8),
            itemBuilder: (context, index) {
              return BankCard();
            },
          ),
        );
      },
    );
  }
}
