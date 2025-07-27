part of 'index.dart';

class WalletView extends GetView<WalletController> {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WalletController>(
      init: WalletController(),
      id: "wallet",
      builder: (_) {
        return Scaffold(
          backgroundColor: Color(0xfff5f5f5),
          body: ListView(
            children: [
              Stack(
                children: [
                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xffff5800).withAlpha(200),
                            Colors.transparent,
                          ],
                          stops: [0.5, 0.5],
                        ),
                      ),
                    ),
                  ),
                  AccountBalance(),
                ],
              ),
              buildMenus(),
              Obx(() => buildTabs(controller.isWithdrawal.value)),
              Obx(() => WalletChannels(controller.isWithdrawal.value)),
            ],
          ),
        );
      },
    );
  }

  buildTabs(bool isWithdrawal) {
    return Padding(
      padding: EdgeInsetsGeometry.all(16),
      child: Column(
        children: [
          Row(
            spacing: 8,
            children: [
              buildButton("充值", !isWithdrawal, () {
                controller.changeView(false);
              }),
              buildButton("提现", isWithdrawal, () {
                controller.changeView(true);
              }),
            ],
          ),
          Divider(height: 0, color: AppColor.main, thickness: 0.5),
        ],
      ),
    );
  }

  buildMenus() {
    return Card(
      margin: EdgeInsets.only(left: 16, right: 16),
      // elevation: 10,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(4),
      ),
      child: SizedBox(
        height: 96,
        child: GridView(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          children: [
            WalletMenu(IconFont.yinxingqia, "提款账户"),
            WalletMenu(IconFont.jilu2, "交易记录"),
            WalletMenu(IconFont.chongzhijilu, "充提记录"),
            WalletMenu(IconFont.kefu, "联系客服"),
          ],
        ),
      ),
    );
  }

  buildButton(String name, bool filled, VoidCallback onTap) {
    const border = BorderSide(color: AppColor.main);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints(minWidth: 100),
        height: 32,
        decoration: BoxDecoration(
          color: filled ? AppColor.main : null,
          border: filled
              ? null
              : Border(left: border, right: border, top: border),
          borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
        ),
        child: Text(
          "充值",
          style: TextStyle(
            fontSize: 14,
            color: filled ? Colors.white : AppColor.main,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
