import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/back_button/back_button.dart';
import '../../../components/rounded_tab_indicator/rounded_tab_indicator.dart';
import '../../../iconfont/iconfont.dart';
import '../../../theme/theme.dart';
import '../index.dart';

class SearchingBar extends GetView<SearchingController> implements PreferredSizeWidget {
  const SearchingBar({super.key});

  @override
  Widget build(BuildContext context) {
    const barHeight = 16.0;

    return AppBar(
      toolbarHeight: 56,
      leading: const VicBackButton(),
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: CupertinoSearchTextField(
          controller: controller.input,
          style: const TextStyle(fontSize: 14),
          borderRadius: BorderRadius.circular(100),
          prefixIcon: const SizedBox(),
          suffixIcon: const Icon(IconFont.sousuo),
          onSuffixTap: controller.search,
          suffixMode: OverlayVisibilityMode.always,
          suffixInsets: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          onSubmitted: controller.search,
        ),
      ),
      // actions: [Filter()],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(barHeight),
        child: TabBar(
          overlayColor: const WidgetStatePropertyAll(Colors.transparent),
          controller: controller.tab,
          padding: const EdgeInsets.only(bottom: 4),
          dividerHeight: 0,
          indicator: RoundedTabIndicator(
            color: AppColors.primary,
            height: barHeight + 8,
            // bottom: 0,
          ),
          labelColor: AppColors.white,
          onTap: controller.search,
          tabs: controller.tabs.map((tab) => Tab(height: 20, text: tab.name.tr)).toList(),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
