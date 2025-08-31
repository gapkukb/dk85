import 'package:app/theme/index.dart';
import 'package:app/widgets/back_button/back_button.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ActivityDetailView extends StatefulWidget {
  const ActivityDetailView({super.key});

  @override
  _ActivityDetailViewState createState() => _ActivityDetailViewState();
}

class _ActivityDetailViewState extends State<ActivityDetailView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(leading: AKBackButton(), title: Text('详情')),
        body: ListView(
          padding: Gutter.horizontal.normal,
          children: [Text('假装有内容${Get.parameters['name']}')],
        ),
      ),
    );
  }
}
