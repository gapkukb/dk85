import 'package:victory/components/state_block/state_block.dart';
import 'package:victory/shared/date_view/data_view_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:skeletonizer/skeletonizer.dart';

class VicDataView<T, R extends DataViewLogic> extends StatelessWidget {
  final bool enablePullDown;
  final bool enablePullUp;
  final R controller;
  final Widget? Function(BuildContext context, int index, T item) itemBuilder;
  final IndexedWidgetBuilder? separatorBuilder;

  const VicDataView({
    super.key,
    required this.controller,
    this.enablePullDown = true,
    this.enablePullUp = false,
    required this.itemBuilder,
    this.separatorBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final view = _buildView();
      if (controller.initialLoading.value) return Skeletonizer(child: view);
      if (controller.data.isEmpty) return const VicStateBlock();
      return SmartRefresher(
        controller: controller.refresher,
        onLoading: controller.loadMore,
        onRefresh: controller.onRefresh,
        enablePullDown: enablePullDown,
        enablePullUp: enablePullUp,
        child: view,
      );
    });
  }

  Widget _buildView() {
    final d = controller.initialLoading.value ? controller.provideMock() : controller.data;
    final padding = const EdgeInsets.fromLTRB(12, 0, 12, 12);
    Widget? builder(context, index) {
      return itemBuilder(context, index, d[index]);
    }

    if (separatorBuilder == null) {
      return ListView.builder(itemCount: d.length, itemBuilder: builder, padding: padding);
    }
    return ListView.separated(itemCount: d.length, itemBuilder: builder, separatorBuilder: separatorBuilder!, padding: padding);
  }
}
