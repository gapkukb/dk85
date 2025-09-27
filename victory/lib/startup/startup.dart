import 'package:flutter/material.dart';
import 'package:victory/env.dart';
import 'package:victory/helper/charles_monitor.dart';
import 'package:victory/modals/modals.dart';
import 'package:victory/pages/debug/view.dart';
import 'package:victory/pages/root/index.dart';
import 'package:victory/startup/bot_toast.dart';

/// 显示初始化
Widget startup(BuildContext context, Widget? child) {
  child = setupBotToast(context, child);
  // if (Environment.isDev || CharlesProxyHttpOverride.debug) {
  //   child = DebugView(child: child);
  // }
  return RootView(child: child);
}
