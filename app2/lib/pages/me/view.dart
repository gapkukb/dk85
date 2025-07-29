import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_app_bar.dart';
import 'index.dart';
import 'widgets/widgets.dart';

class MePage extends GetView<MeController> {
  const MePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MeController>(
      builder: (_) {
        return Scaffold(
          appBar: CustomAppBar(title: "我的"),
          body: SafeArea(child: ListView(children: [])),
        );
      },
    );
  }
}
