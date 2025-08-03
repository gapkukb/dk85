part of 'index.dart';

const _style = TextStyle(color: Colors.black87, fontSize: 14);

final lightTheme = ThemeData.light().copyWith(
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.danger,
    onPrimary: AppColors.danger,
    secondary: AppColors.warn,
    onSecondary: AppColors.warn,
    error: Colors.red,
    onError: Colors.red,
    surface: Colors.white,
    onSurface: Colors.white,
  ),
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
  textSelectionTheme: const TextSelectionThemeData(cursorColor: AppColors.primary),
  inputDecorationTheme: const InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    hintStyle: TextStyle(fontSize: 14, color: AppColors.description),
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
    prefixIconConstraints: BoxConstraints.tightFor(width: 34, height: 48),
    suffixIconConstraints: BoxConstraints.tightFor(width: 34, height: 48),
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(width: 0, style: BorderStyle.none),
    ),

    // errorBorder: OutlineInputBorder(
    //   borderRadius: BorderRadius.all(Radius.circular(100)),
    //   borderSide: BorderSide(width: 0, style: BorderStyle.none),
    // ),
  ),
);
