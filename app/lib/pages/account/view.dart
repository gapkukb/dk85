part of 'index.dart';

class AccountView extends GetView<AccountController> {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountController>(
      init: AccountController(),
      id: "account",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            actionsPadding: EdgeInsets.only(right: 16),
            title: UnconstrainedBox(
              child: CupertinoButton.filled(
                alignment: Alignment(0.5, 0.5),
                sizeStyle: CupertinoButtonSize.small,
                color: AppColor.main,
                onPressed: () {
                  Get.bottomSheet(
                    BottomSheet(
                      shape: LinearBorder(),
                      onClosing: () {},
                      builder: (context) {
                        return ListView(
                          itemExtent: 44,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(onPressed: () {}, child: Text("取消")),
                                Text(
                                  "标题标题标题",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                IconButton(
                                  onPressed: () {
                                    Get.closeAllBottomSheets();
                                  },
                                  icon: Icon(Icons.cancel_outlined),
                                ),
                              ],
                            ),
                            ListTile(title: Text("data")),
                            ListTile(title: Text("data")),
                            ListTile(title: Text("data")),
                            ListTile(title: Text("data")),
                            ListTile(title: Text("data")),
                          ],
                        );
                      },
                    ),
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 2,
                  children: [
                    Icon(Icons.language),
                    Text("简体中文", style: TextStyle(fontSize: 12)),
                    Icon(Icons.keyboard_arrow_down_outlined),
                  ],
                ),
              ),
            ),
            actions: [
              CustomerServiceButton(),
              SizedBox(width: 8),
              CupertinoButton(
                sizeStyle: CupertinoButtonSize.small,
                padding: EdgeInsets.all(0),
                color: AppColor.main,
                onPressed: () {},
                child: Row(children: [Icon(Icons.close, color: Colors.white)]),
              ),
            ],
          ),
          body: ListView(children: [AccountInput()]),
        );
      },
    );
  }
}
