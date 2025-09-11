import 'package:app/views_modal/completion/completion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

void main() {
  runApp(DemoView());
}

class DemoView extends StatefulWidget {
  const DemoView({super.key});

  @override
  State<DemoView> createState() => _DemoViewState();
}

class _DemoViewState extends State<DemoView> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      //your dialog
      Get.dialog(CompletionModal());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('SliverGrid with Cross-Row & Cross-Column')),
        body: Container(),
      ),
    );
  }
}
