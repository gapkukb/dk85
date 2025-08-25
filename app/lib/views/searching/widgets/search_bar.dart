import 'package:app/iconfont/index.dart';
import 'package:app/theme/index.dart';
import 'package:app/views/searching/index.dart';
import 'package:app/views/searching/widgets/filter.dart';
import 'package:app/widgets/back_button/back_button.dart';
import 'package:app/widgets/rounded_tab_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nil/nil.dart';

class SearchingBar extends GetView<SearchingController>
    implements PreferredSizeWidget {
  const SearchingBar({super.key});

  @override
  Widget build(BuildContext context) {
    const barHeight = 16.0;

    return AppBar(
      toolbarHeight: 56,
      leading: AKBackButton(),
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: CupertinoSearchTextField(
          controller: controller.input,
          style: TextStyle(fontSize: 14),
          borderRadius: BorderRadius.circular(100),
          prefixIcon: SizedBox(),
          suffixIcon: Icon(IconFont.sousuo),
          onSuffixTap: controller.search,
          suffixMode: OverlayVisibilityMode.always,
          suffixInsets: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          onSubmitted: controller.search,
        ),
      ),
      // actions: [Filter()],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(barHeight),
        child: TabBar(
          overlayColor: WidgetStatePropertyAll(Colors.transparent),
          controller: controller.tab,
          padding: EdgeInsets.only(bottom: 4),
          dividerHeight: 0,
          indicator: RoundedTabIndicator(
            color: AppColors.primary,
            height: barHeight + 8,
            // bottom: 0,
          ),
          labelColor: AppColors.white,
          onTap: controller.search,
          tabs: controller.tabs
              .map((tab) => Tab(height: 20, text: tab.name.tr))
              .toList(),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80);
}
