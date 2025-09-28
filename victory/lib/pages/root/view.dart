import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:victory/pages/demo/lucky_spin_floating.dart';

import 'index.dart';

class RootView extends StatefulWidget {
  final Widget child;
  const RootView({super.key, required this.child});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _RootViewGetX(child: widget.child);
  }
}

class _RootViewGetX extends GetView<RootController> {
  final Widget child;
  const _RootViewGetX({required this.child});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RootController>(
      init: RootController(),
      id: "root",
      builder: (_) {
        return Scaffold(
          body: Stack(
            children: [
              child,
              // if (controller.showFloatingButton.value) const LuckySpinFloating(),
            ],
          ),
        );
      },
    );
  }
}
