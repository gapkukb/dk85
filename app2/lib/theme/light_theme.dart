part of 'index.dart';

final lightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme().copyWith(
    backgroundColor: Colors.white,
    centerTitle: true,
    scrolledUnderElevation: 1,
    toolbarTextStyle: TextStyle(fontSize: 14),
    titleTextStyle: ThemeData.light().appBarTheme.titleTextStyle?.copyWith(
      fontSize: 14,
    ),
  ),
  textTheme: textTheme,
  primaryColor: Color(0xffff5800),
  cardTheme: CardThemeData().copyWith(color: Colors.white),

  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.primary,
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4),side: ),
    ),
  ),
);
