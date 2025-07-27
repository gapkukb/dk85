import 'package:app/widgets/network_picture.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BankCard extends StatelessWidget {
  const BankCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        color: Color(0xff334b7b),
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [Color(0xff4e83cd), Color(0xff383865)],
        ),
      ),
      child: DefaultTextStyle(
        style: TextStyle(color: Colors.white),
        child: Column(
          children: [
            ListTile(
              leadingAndTrailingTextStyle: TextStyle(color: Colors.white),
              minLeadingWidth: 64,
              leading: ClipOval(
                clipBehavior: Clip.antiAlias,
                child: NetworkPicture(
                  width: 64,
                  height: 64,
                  imageUrl:
                      "https://play.google.com/store/apps/details?id=com.kbzbank.kpaycustomer",
                ),
              ),
              trailing: Text("KBZ BANK", style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              leadingAndTrailingTextStyle: TextStyle(color: Colors.white),
              title: Text("KBZ BANK"),
              trailing: Text("KBZ BANK"),
            ),
            // ListTile(title: Text("KBZ BANK"), trailing: Text("KBZ BANK")),
          ],
        ),
      ),
    );
  }
}
