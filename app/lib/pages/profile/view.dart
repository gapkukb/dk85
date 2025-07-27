part of 'index.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      id: "profile",
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            child: ListView(
              children: [
                buildUser(),
                AccountBalance(),
                buildItem("洗码"),
                buildItem("账户设置"),
                buildItem("会员权益", style: TextStyle(color: AppColor.main)),
                buildItem("邀请好友"),
                buildItem("我收藏的游戏"),
                buildItem("联系客服"),
                buildItem("消息中心"),
                buildItem("更多"),
              ],
            ),
          ),
        );
      },
    );
  }

  buildUser() {
    return ListTile(
      leading: CircleAvatar(
        radius: 32,
        foregroundImage: CachedNetworkImageProvider(
          "https://picsum.photos/id/1/80/80",
        ),
      ),
      title: Text("Playr 12312"),
      subtitle: Row(
        children: [
          Text("id:1231233"),
          SizedBox.square(
            dimension: 24,
            child: TextButton(
              onPressed: () async {
                await Clipboard.setData(ClipboardData(text: "isfasfsf"));
                Fluttertoast.showToast(msg: "3213");
              },
              child: Icon(Icons.copy, size: 12),
            ),
          ),
        ],
      ),
    );
  }

  buildItem(
    String title, {
    VoidCallback? callback,
    String? to,
    TextStyle? style,
  }) {
    return ListTile(
      onTap: () {
        if (callback == null) {
          Get.toNamed(to!);
        } else {
          callback();
        }
      },
      minTileHeight: 44,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ).merge(style),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_outlined,
        size: 14,
        color: Color(0xff999999),
      ),
    );
  }
}
