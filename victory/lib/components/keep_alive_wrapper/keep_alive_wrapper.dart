import 'package:flutter/material.dart';

class VicKeepAlive extends StatefulWidget {
  const VicKeepAlive({
    super.key,
    this.keepAlive = true,
    required this.child,
  });
  final bool keepAlive;
  final Widget child;

  @override
  VicKeepAliveState createState() => VicKeepAliveState();
}

class VicKeepAliveState extends State<VicKeepAlive> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  // @override
  // void didUpdateWidget(covariant KeepAliveWrapper oldWidget) {
  //   if (oldWidget.keepAlive != widget.keepAlive) {
  //     // keepAlive 状态需要更新，实现在 AutomaticKeepAliveClientMixin 中
  //     updateKeepAlive();
  //   }
  //   super.didUpdateWidget(oldWidget);
  // }

  @override
  bool get wantKeepAlive => widget.keepAlive;
}
