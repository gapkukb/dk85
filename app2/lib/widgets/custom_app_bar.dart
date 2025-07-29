import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  const CustomAppBar({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    final route = ModalRoute.of(context);
    IconData? icon;
    if (route is PageRoute && route.canPop) {
      if (route.fullscreenDialog) {
        icon = Icons.close;
      } else {
        icon = Icons.arrow_back_ios;
      }
    }

    route is PageRoute && route.canPop && route.fullscreenDialog;

    return CupertinoNavigationBar(
      middle: Text(title ?? ""),
      backgroundColor: Colors.white,
      leading: icon == null
          ? null
          : CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                route!.navigator!.maybePop();
              },
              child: Icon(icon),
            ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(44);
}
