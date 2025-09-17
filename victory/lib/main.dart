import 'package:flutter/material.dart';
import 'application.dart';
import 'services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await services.initialize();

  runApp(const Application());
}
