import '../../../theme/index.dart';
import 'home_tab_bar_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/iconfont/index.dart';
import 'package:flutter/material.dart';

class _HomeTabBar {
  final AssetImage icon;
  final String label;
  // final Color color;
  const _HomeTabBar(this.icon, this.label);
}

class HomeTabBar extends StatelessWidget implements PreferredSizeWidget {
  static final tabs = <_HomeTabBar>[
    const _HomeTabBar(AssetImage("assets/images/hot.webp"), 'app.foru'),
    const _HomeTabBar(AssetImage("assets/images/slots.webp"), 'app.slots'),
    const _HomeTabBar(AssetImage("assets/images/fishing.webp"), 'app.fishing'),
    const _HomeTabBar(AssetImage("assets/images/poker.webp"), 'app.poker'),
    // _HomeTabBar(const AssetImage("assets/images/casino.webp"), '真人'.tr),
  ];

  const HomeTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelStyle: const TextStyle(fontSize: 12),
      dividerHeight: 0,
      indicatorWeight: 0,
      labelColor: Colors.white,
      indicator: RoundedTabIndicator(height: 20, color: AppColors.primary),
      tabs: tabs.map((tab) {
        return Tab(
          height: 56,
          icon: Image(image: tab.icon, width: 28, height: 28),
          text: tab.label.tr,
        );
      }).toList(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

class RoundedTabIndicator extends Decoration {
  RoundedTabIndicator({Color color = Colors.white, double radius = 2.0, double height = 4.0, double bottomMargin = 10.0}) : _painter = _RoundedRectanglePainter(color, height, radius, bottomMargin);

  final BoxPainter _painter;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _painter;
  }
}

class _RoundedRectanglePainter extends BoxPainter {
  _RoundedRectanglePainter(Color color, this.height, this.radius, this.bottomMargin)
    : _paint = Paint()
        ..color = color
        ..isAntiAlias = true;

  final Paint _paint;
  final double radius;
  final double height;
  final double bottomMargin;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final centerX = (cfg.size?.width ?? 0) / 2 + offset.dx;
    final bottom = (cfg.size?.height) ?? 0 - bottomMargin;
    final halfWidth = cfg.size?.width ?? 0 / 2;
    final Rect rect = (offset - const Offset(0, 4)) & cfg.size!;
    canvas.drawRRect(RRect.fromLTRBR(rect.left - 4, rect.bottom - height, rect.right + 4, rect.bottom, Radius.circular(radius)), _paint);
  }
}
