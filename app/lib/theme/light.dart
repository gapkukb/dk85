import 'package:app/theme/index.dart';
import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  // primaryColor: const Color(0x00ff5800),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme().copyWith(
    backgroundColor: Colors.white,
    titleTextStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: AppColor.primary,
    ),
    centerTitle: true,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
  ),
  bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.white),
  primarySwatch: Colors.blue,
  textTheme: TextTheme(
    displayLarge: TextStyle(fontSize: 96.0, fontWeight: FontWeight.bold),
    displayMedium: TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold),
    displaySmall: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
    headlineLarge: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
    headlineMedium: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold),
    headlineSmall: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
    titleLarge: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
    titleMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
    titleSmall: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
    bodyLarge: TextStyle(fontSize: 18.0), // Default body text size
    bodyMedium: TextStyle(fontSize: 16.0), // Another common body size
    bodySmall: TextStyle(fontSize: 14.0),
    labelLarge: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
    labelMedium: TextStyle(fontSize: 12.0),
    labelSmall: TextStyle(fontSize: 10.0),
  ),
  cardTheme: CardThemeData(surfaceTintColor: Colors.white, color: Colors.white),
  listTileTheme: ListTileThemeData().copyWith(
    minTileHeight: 48,
    titleTextStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Color(0xff111111),
    ),
    leadingAndTrailingTextStyle: TextStyle(
      fontSize: 14,
      color: Color(0xff999999),
    ),
  ),
);
