import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

/// hello
class HelloWidget extends GetView<DashboardController> {
  const HelloWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Obx(() => const Text("controller.state.title")));
  }
}
