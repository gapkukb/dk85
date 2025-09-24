import 'package:flutter/material.dart';
import '../env.dart';
import '../helper/charles_monitor.dart';
import '../pages/debug/view.dart';
import 'bot_toast.dart';

/// 显示初始化
Widget startup(BuildContext context, Widget? child) {
  child = setupBotToast(context, child);
  if (Environment.isDev || CharlesProxyHttpOverride.debug) {
    child = DebugView(child: child);
  }
  return child;
}
