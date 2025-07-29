import '/widgets/network_picture.dart';
import 'package:flutter/material.dart';

class WalletChannels extends StatelessWidget {
  final Function(int index) onTap;
  final bool isWidthrawal;
  const WalletChannels(this.isWidthrawal, {super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      // mainAxisSize: MainAxisSize.min,
      children: [
        buidlItem(1),
        buidlItem(1),
        buidlItem(1),
        buidlItem(1),
        buidlItem(1),
        buidlItem(1),
        buidlItem(1),
        buidlItem(1),
        buidlItem(1),
      ],
    );
  }

  buidlItem(int index) {
    return ListTile(
      onTap: () => onTap(index),
      tileColor: Colors.white,
      leading: ClipOval(
        clipBehavior: Clip.hardEdge,
        child: NetworkPicture(
          width: 36,
          height: 36,
          imageUrl: "https://picsum.photos/id/248/200/300",
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        isWidthrawal ? "Mrs. Akeem Kshlerin" : "Ms. Piper Wyman",
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
      trailing: Opacity(
        opacity: 0.5,
        child: Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
