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
      appBar: const CupertinoNavigationBar(automaticallyImplyLeading: true, middle: Text("Recharge Details"), trailing: ServiceCalling()),
      body: ListView(
        children: [
          const Row(children: [Text("Receiving Account", style: AppText.title)]),
          buildItem(
            title: "Receiving Account",
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 4,
              children: [
                NetworkPicture(imageUrl: "https://imgcdn.knryywqf.com/upload/images/202501/34989806-89dd-4b1f-9609-ee0e7541614e.jpg", width: 28, height: 28),
                const Text("KBZpay", style: AppText.title),
              ],
            ),
          ),
          buildItem(
            title: "Receiving Account",
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 4,
              children: [Text("09666094925", style: AppText.title)],
            ),
          ),
          buildItem(
            title: "Amount Due",
            child: RichText(
              text: const TextSpan(
                style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.primary),
                text: "20000.00",
                children: [
                  TextSpan(
                    text: " MMK",
                    style: TextStyle(color: AppColors.title),
                  ),
                ],
              ),
            ),
          ),
          RichText(
            text: const TextSpan(
              style: TextStyle(fontWeight: FontWeight.bold),
              text: "Transaction ID",
              children: [
                TextSpan(
                  text: "(Required)",
                  style: TextStyle(color: AppColors.primary),
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
