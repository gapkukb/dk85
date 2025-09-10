import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(DemoView());
}

class DemoView extends StatelessWidget {
  const DemoView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('SliverGrid with Cross-Row & Cross-Column')),
        body: MySliverGrid(),
      ),
    );
  }
}

class MySliverGrid extends StatelessWidget {
  // 定义每个网格项的跨行和跨列
  final List<Map<String, int>> itemLayouts = [
    {'index': 0, 'crossAxisSpan': 2, 'mainAxisSpan': 2},
    {'index': 1, 'crossAxisSpan': 1, 'mainAxisSpan': 1},
    {'index': 2, 'crossAxisSpan': 1, 'mainAxisSpan': 2},
    {'index': 3, 'crossAxisSpan': 1, 'mainAxisSpan': 1},
    {'index': 4, 'crossAxisSpan': 1, 'mainAxisSpan': 1},
    {'index': 5, 'crossAxisSpan': 2, 'mainAxisSpan': 1},
    {'index': 6, 'crossAxisSpan': 1, 'mainAxisSpan': 1},
    {'index': 7, 'crossAxisSpan': 1, 'mainAxisSpan': 1},
    {'index': 8, 'crossAxisSpan': 2, 'mainAxisSpan': 1},
    {'index': 9, 'crossAxisSpan': 1, 'mainAxisSpan': 2},
  ];

  MySliverGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              final layout = itemLayouts[index];
              return Container(
                color: Colors.blue[100 * (index % 9)],
                alignment: Alignment.center,
                child: Text('${layout['index']}', style: TextStyle(color: Colors.white)),
              );
            },
            childCount: itemLayouts.length, // 基于定义的项数
          ),
          gridDelegate: CrossRowCrossColumnGridDelegate(
            crossAxisCount: 3, // 每行显示 3 列
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
            itemLayouts: itemLayouts,
          ),
        ),
      ],
    );
  }
}

// 自定义 GridDelegate 以支持跨行和跨列的功能
class CrossRowCrossColumnGridDelegate extends SliverGridDelegate {
  final int crossAxisCount; // 每行显示的列数
  final double crossAxisSpacing; // 列间距
  final double mainAxisSpacing; // 行间距
  final List<Map<String, int>> itemLayouts; // 存储每个子项的跨列和跨行信息

  CrossRowCrossColumnGridDelegate({required this.crossAxisCount, required this.crossAxisSpacing, required this.mainAxisSpacing, required this.itemLayouts});

  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    return CrossRowCrossColumnGridLayout(
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: crossAxisSpacing,
      mainAxisSpacing: mainAxisSpacing,
      itemLayouts: itemLayouts,
      constraints: constraints,
    );
  }

  @override
  bool shouldRelayout(covariant SliverGridDelegate oldDelegate) {
    return oldDelegate is! CrossRowCrossColumnGridDelegate ||
        crossAxisCount != oldDelegate.crossAxisCount ||
        crossAxisSpacing != oldDelegate.crossAxisSpacing ||
        mainAxisSpacing != oldDelegate.mainAxisSpacing ||
        itemLayouts != oldDelegate.itemLayouts;
  }

  @override
  int getMaxCrossAxisIndex(int firstIndex, int lastIndex) {
    return lastIndex;
  }
}

// 自定义 GridLayout 以处理跨列跨行布局
class CrossRowCrossColumnGridLayout extends SliverGridLayout {
  final int crossAxisCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final List<Map<String, int>> itemLayouts;
  final SliverConstraints constraints;

  const CrossRowCrossColumnGridLayout({
    required this.crossAxisCount,
    required this.crossAxisSpacing,
    required this.mainAxisSpacing,
    required this.itemLayouts,
    required this.constraints,
  });

  @override
  SliverGridGeometry getGeometryForChildIndex(int index) {
    final layout = itemLayouts[index];
    final crossAxisSpan = layout['crossAxisSpan'] ?? 1;
    final mainAxisSpan = layout['mainAxisSpan'] ?? 1;

    // 计算横向位置
    final crossAxisPosition = (index % crossAxisCount) * (constraints.crossAxisExtent / crossAxisCount) + (index % crossAxisCount) * crossAxisSpacing;

    // 计算纵向位置
    final mainAxisPosition = (index ~/ crossAxisCount) * (constraints.viewportMainAxisExtent / crossAxisCount) + (index ~/ crossAxisCount) * mainAxisSpacing;

    // 返回项的位置和大小
    return SliverGridGeometry(
      scrollOffset: mainAxisPosition,
      crossAxisOffset: crossAxisPosition,
      crossAxisExtent: (constraints.crossAxisExtent / crossAxisCount) * crossAxisSpan,
      mainAxisExtent: (constraints.viewportMainAxisExtent / crossAxisCount) * mainAxisSpan,
    );
  }

  // 计算最大滚动偏移量
  @override
  double computeMaxScrollOffset(int childCount) {
    // 计算总的行数
    int totalRows = (childCount / crossAxisCount).ceil();
    return totalRows * (constraints.viewportMainAxisExtent / crossAxisCount) + (totalRows - 1) * mainAxisSpacing;
  }

  // 根据滚动偏移量返回可见的最大子项索引
  @override
  int getMaxChildIndexForScrollOffset(double scrollOffset) {
    return (scrollOffset / (constraints.viewportMainAxisExtent / crossAxisCount)).floor();
  }

  // 根据滚动偏移量返回可见的最小子项索引
  @override
  int getMinChildIndexForScrollOffset(double scrollOffset) {
    return (scrollOffset / (constraints.viewportMainAxisExtent / crossAxisCount)).floor();
  }
}
