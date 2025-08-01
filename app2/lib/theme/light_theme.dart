part of 'index.dart';

final lightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: Colors.white,
  listTileTheme: const ListTileThemeData(
    titleTextStyle: TextStyle(fontSize: 14, color: AppColors.primary),
    minTileHeight: 48,
    tileColor: Colors.white,
    subtitleTextStyle: TextStyle(fontSize: 12, color: AppColors.label),
    leadingAndTrailingTextStyle: TextStyle(fontSize: 14, color: AppColors.label),
  ),
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: Colors.white,
    leadingWidth: 44,
    titleTextStyle: const TextStyle(fontSize: 16, color: AppColors.primary),
    iconTheme: const IconThemeData(color: AppColors.label, size: 26),
    scrolledUnderElevation: 0,
    shape: LinearBorder.bottom(side: BorderSide(color: Colors.black.withAlpha(10))),
  ),
  // textTheme: textTheme,
  cardTheme: const CardThemeData().copyWith(color: Colors.white),

  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.primary,
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4),side: ),
    ),
  ),
);
