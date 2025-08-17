import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

class DemoView extends StatelessWidget {
  const DemoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            ElevatedButton(
              onPressed: () {
                BotToast.showText(text: "loading....");
              },
              child: const Text("toast"),
            ),
            ...List.generate(100, (index) {
              return const SizedBox(child: Text("datadatadatadatadatadatadatadatadatadatadatadatadatadata"));
            }),
          ],
        ),
      ),
    );
  }
}
