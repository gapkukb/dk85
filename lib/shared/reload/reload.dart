import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Reloadable extends StatefulWidget {
  Reloadable({required this.child});

  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_ReloadableState>()!.restartApp();
  }

  @override
  _ReloadableState createState() => _ReloadableState();
}

class _ReloadableState extends State<Reloadable> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(key: key, child: widget.child);
  }
}
