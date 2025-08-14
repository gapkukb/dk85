part of 'index.dart';

const _style = TextStyle(color: AppColors.title, fontSize: 14);

final lightTheme = ThemeData.light().copyWith(
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: AppColors.primary,
    secondary: AppColors.warn,
    onSecondary: AppColors.warn,
    error: Colors.red,
    onError: Colors.red,
    surface: AppColors.background,
    onSurface: AppColors.title,
  ),
  textTheme: const TextTheme(
    bodyLarge: _style,
    displayLarge: _style,
    displayMedium: _style,
    displaySmall: _style,
    headlineLarge: _style,
    headlineMedium: _style,
    headlineSmall: _style,
    titleLarge: _style,
    titleMedium: _style,
    titleSmall: _style,
    bodyMedium: _style,
    bodySmall: _style,
    labelLarge: _style,
    labelMedium: _style,
    labelSmall: _style,
  ),
  scaffoldBackgroundColor: AppColors.background,
  listTileTheme: const ListTileThemeData(
    titleTextStyle: TextStyle(fontSize: 14, color: AppColors.title),
    minTileHeight: 56,
    tileColor: Colors.white,
    contentPadding: EdgeInsets.only(left: 12, right: 12),
    subtitleTextStyle: TextStyle(fontSize: 12, color: AppColors.label),
    leadingAndTrailingTextStyle: TextStyle(fontSize: 14, color: AppColors.label),
  ),
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: AppColors.background,
    scrolledUnderElevation: 0,
    actionsPadding: const EdgeInsets.only(right: 12),

    // leadingWidth: 44,
    // titleTextStyle: const TextStyle(fontSize: 16, color: AppColors.primary),
    // iconTheme: const IconThemeData(color: AppColors.label, size: 26),
    // scrolledUnderElevation: 0,
    // shape: LinearBorder.bottom(side: BorderSide(color: Colors.black.withAlpha(10))),
    // toolbarTextStyle: const TextStyle(color: Colors.black),
  ),
  // textTheme: textTheme,
  // cardTheme: const CardThemeData().copyWith(color: Colors.white),

  // outlinedButtonTheme: OutlinedButtonThemeData(
  //   style: OutlinedButton.styleFrom(
  //     foregroundColor: AppColors.primary,
  //     // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4),side: ),
  //   ),
  // ),
  textSelectionTheme: const TextSelectionThemeData(cursorColor: AppColors.primary),
  inputDecorationTheme: const InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    hintStyle: TextStyle(fontSize: 12, color: AppColors.description),
    // errorStyle: _style,
    labelStyle: _style,
    helperStyle: _style,
    prefixStyle: _style,
    suffixStyle: _style,
    counterStyle: _style,
    floatingLabelStyle: _style,
    outlineBorder: BorderSide.none,
    filled: true,
    prefixIconColor: AppColors.description,
    suffixIconColor: AppColors.description,
    fillColor: Color(0xfff5f5f5),
    prefixIconConstraints: BoxConstraints.tightFor(width: 34, height: 56),
    suffixIconConstraints: BoxConstraints.tightFor(width: 34, height: 56),
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(width: 0, style: BorderStyle.none),
    ),

    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(100)),
      borderSide: BorderSide(width: 0, style: BorderStyle.none),
    ),
  ),
);
