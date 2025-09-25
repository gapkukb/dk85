import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:victory/iconfont/iconfont.dart';

class Filter extends GetView<SearchController> {
  const Filter({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: show, icon: const Icon(IconFont.guolvqi));
  }

  show() async {}
}
