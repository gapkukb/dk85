import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/button/button.dart';
import 'pages/about/about.dart';
import 'pages/shell/shell.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((a) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(splashFactory: NoSplash.splashFactory),
      title: 'Flutter Demo',
      home: const ShellPage(),
      getPages: [GetPage(name: '/about', participatesInRootNavigator: true, page: () => const AboutPage())],
    );
  }
}
