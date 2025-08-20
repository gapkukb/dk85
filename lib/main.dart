import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/utils.dart';
import 'package:jjj/application.dart';
import 'package:jjj/services/index.dart';
import 'package:jjj/views/splash/splash.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // runApp(const SplashView());
  // await Future.delayed(Duration(seconds: 3));
  setupServices();
  runApp(const Application());
}
