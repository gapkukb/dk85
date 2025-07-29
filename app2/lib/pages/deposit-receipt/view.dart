import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/index.dart';
import '../../widgets/network_picture.dart';
import '../../widgets/service_calling.dart';

class DepositReceiptView extends StatelessWidget {
  const DepositReceiptView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        automaticallyImplyLeading: true,
        middle: Text("Recharge Details"),
        trailing: ServiceCalling(),
      ),
      body: ListView(
        children: [
          Row(children: [Text("Receiving Account", style: AppText.title)]),
          buildItem(
            title: "Receiving Account",
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 4,
              children: [
                NetworkPicture(
                  imageUrl:
                      "https://imgcdn.knryywqf.com/upload/images/202501/34989806-89dd-4b1f-9609-ee0e7541614e.jpg",
                  width: 28,
                  height: 28,
                ),
                Text("KBZpay", style: AppText.title),
              ],
            ),
          ),
          buildItem(
            title: "Receiving Account",
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 4,
              children: [Text("09666094925", style: AppText.title)],
            ),
          ),
          buildItem(
            title: "Amount Due",
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.danger,
                ),
                text: "20000.00",
                children: [
                  TextSpan(
                    text: " MMK",
                    style: TextStyle(color: AppColors.primary),
                  ),
                ],
              ),
            ),
          ),
          RichText(
            text: TextSpan(
              style: TextStyle(fontWeight: FontWeight.bold),
              text: "Transaction ID",
              children: [
                TextSpan(
                  text: "(Required)",
                  style: TextStyle(color: AppColors.danger),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildItem({required String title, required Widget child}) {
    return ListTile(
      title: Text(title, style: AppText.label),
      trailing: child,
    );
  }
}
