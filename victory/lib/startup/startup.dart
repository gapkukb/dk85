import 'package:flutter/material.dart';
import '../debug/debug_view.dart';
import '../storage/storage.dart';
import 'bot_toast.dart';

Widget startup(BuildContext context, Widget? child) {
  child = setupBotToast(context, child);
  if (storage.debug.value) {
    storage.debug.clear();
    child = DebugView(child: child);
  }
  return child;
}
