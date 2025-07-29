part of 'index.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  MoreViewController get controller => Get.put(MoreViewController());

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // appBar: AppBar(title: Text("更多设置"), automaticallyImplyLeading: true),
      navigationBar: const CupertinoNavigationBar(
        middle: Text('更多设置'),
        // automaticallyImplyMiddle: false,
        automaticallyImplyLeading: true,
        brightness: Brightness.dark,
        previousPageTitle: "返回",
      ),
      child: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            CupertinoListTile(
              title: Text("背景音乐"),
              additionalInfo: buildItem(false, "未设置"),
              trailing: CupertinoListTileChevron(),
              onTap: () {
                showLanguagesPicker();
              },
            ),

            // Cell(title: "语言", value: "中文简体", isLink: true),
            // Cell(title: "当前版本", value: "V1.0.0"),
            Cell(
              title: "背景音乐",
              valueWidget: CupertinoSwitch(value: true, onChanged: (value) {}),
            ),
            CupertinoListTile(
              title: Text("背景音乐"),
              additionalInfo: buildItem(false, "未设置"),
              trailing: CupertinoListTileChevron(),
            ),
          ],
        ).toList(),
      ),
    );
  }

  buildItem(bool selected, String? text) {
    return Container(
      // height: 18,
      decoration: BoxDecoration(
        color: selected ? Colors.green : Colors.amber,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: Text(
        text ?? "未设置",
        style: TextStyle(fontSize: 12, color: Colors.white, height: 1),
      ),
    );
  }
}
