import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nil/nil.dart';

import '../../../iconfont/index.dart';
import '../index.dart';
import 'app_bar_tabbar.dart';
import 'filter.dart';

class AppBarWidget extends GetView<SearchingController> {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      // forceMaterialTransparency: true,
      leading: const BackButton(style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.white))),
      title: CupertinoSearchTextField(
        prefixIcon: nil,
        onSuffixTap: controller.search,
        onSubmitted: controller.search,
        controller: controller.keywords,
        suffixMode: OverlayVisibilityMode.always,
        suffixIcon: const Icon(IconFont.sousuo),
        suffixInsets: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        style: const TextStyle(fontSize: 14),
        borderRadius: BorderRadius.circular(100),
      ),
      actions: const [SearchingFilterWidget()],
      bottom: const AppBarTabbarWidget(),
    );
  }
}
