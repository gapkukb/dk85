import '/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class RootView extends StatelessWidget {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetRouterOutlet(initialRoute: Routes.dashboard, anchorRoute: '/'),
    );
  }
}
