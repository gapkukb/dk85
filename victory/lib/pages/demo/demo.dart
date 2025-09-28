import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:victory/3rd/text_with_border.dart';
import 'package:victory/animations/fade_scale.dart';
import 'package:victory/modals/views/announcement/announcement.dart';
import 'package:victory/modals/views/completion/completion.dart';
import 'package:victory/modals/views/lucky_spin/view.dart';
import 'package:victory/modals/views/lucky_spin/view_next.dart';
import 'package:victory/pages/demo/lucky_spin_floating.dart';
import 'package:victory/services/services.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({super.key});

  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      // Get.generalDialog(
      //   pageBuilder: (context, animation, secondaryAnimation) => const VicModalLuckySpin(),
      //   // transitionDuration: const Duration(seconds: 3),
      //   transitionBuilder: vicFadeScaleAnimationBuilder,
      // );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('data'),
      ),
      body: ListView(
        children: [],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          services.app.toHomePage();
        },
      ),
    );
  }
}
