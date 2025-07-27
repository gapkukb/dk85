import 'package:flutter/material.dart';

class UserAccount extends StatelessWidget {
  const UserAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("账户设置"),
        // centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: ListView(
        children: [
          buildItem(),
          buildItem(),
          buildItem(),
          buildItem(),
          buildItem(),
        ],
      ),
    );
  }

  buildItem() {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 16, right: 16),
      title: Text("登录密码"),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 4),
              child: Text(
                "未设置",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_outlined,
            size: 16,
            color: Color(0xff999999),
          ),
        ],
      ),
    );
  }
}
