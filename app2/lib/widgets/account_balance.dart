import '/widgets/monetary.dart';
import 'package:flutter/material.dart';

class AccountBalance extends StatelessWidget {
  const AccountBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        // boxShadow: [BoxShadow(blurRadius: 4, color: Colors.black26)],
        borderRadius: BorderRadius.circular(4),
        image: const DecorationImage(
          image: AssetImage("assets/images/balancebg.webp"),
          fit: BoxFit.fill,
        ),
      ),
      child: const DefaultTextStyle(
        style: TextStyle(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 8,
              children: [
                Text("Account Balance", style: TextStyle(fontSize: 16)),
                Icon(Icons.replay_circle_filled, color: Colors.white),
              ],
            ),
            Monetary(fontSize: 48),
          ],
        ),
      ),
    );
  }
}
