import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:scaled_app/scaled_app.dart';
import 'package:app/router/index.dart';

class App extends StatelessWidget {
  const App() : super(key: const Key("app"));

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).scale(),
      child: GetMaterialApp(
        theme: ThemeData(
          // primaryColor: const Color(0x00ff5800),
          primarySwatch: Colors.blue,
        ),
        title: 'DK85',
        binds: [],
        getPages: AppPages.routes,
        initialRoute: AppPages.initial,
      ),
    );
  }
}
