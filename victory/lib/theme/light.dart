import 'package:flutter/material.dart';

import 'package:victory/theme/theme.dart';

const _style = TextStyle(fontSize: 14, color: AppColors.title);
const textTeme = TextTheme(
  bodyLarge: _style,
  bodyMedium: _style,
  bodySmall: _style,
  displayLarge: _style,
  displayMedium: _style,
  displaySmall: _style,
  headlineLarge: _style,
  headlineMedium: _style,
  headlineSmall: _style,
  titleLarge: _style,
  titleMedium: _style,
  titleSmall: _style,
  labelLarge: _style,
  labelMedium: _style,
  labelSmall: _style,
);

const inputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(8)),
  borderSide: BorderSide(width: 0, style: BorderStyle.none),
);
final lightTheme = ThemeData(
  splashFactory: NoSplash.splashFactory,
  scaffoldBackgroundColor: AppColors.background,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.background,
    elevation: 0,
    scrolledUnderElevation: 0,
    titleTextStyle: TextStyle(color: AppColors.title, fontSize: 16, fontWeight: FontWeight.bold),
  ),
  tabBarTheme: const TabBarThemeData(dividerHeight: 0),
  colorScheme: ColorScheme.fromSwatch(
    accentColor: AppColors.background,
    backgroundColor: AppColors.background,
    cardColor: AppColors.background,
    primarySwatch: MaterialColor(AppColors.primary.toARGB32(), {}),
  ),
  brightness: Brightness.light, //深色还是浅色
  // primarySwatch: MaterialColor(primary, swatch), //主题颜色样本
  primaryColor: Colors.white, //主色，决定导航栏颜色
  cardColor: Colors.white, //卡片颜色
  dividerColor: Colors.white, //分割线颜色
  canvasColor: Colors.white, //这是整个屏幕或应用程序窗口的背景色。它定义了所有其他 UI 元素的基色。
  highlightColor: Colors.transparent, //用户点击并按住 Widget 时短暂显示的颜色。它为用户提供了交互已注册的视觉反馈。
  focusColor: Colors.transparent, //有焦点的颜色，这意味着该元素将接收键盘输入。这对于突出显示当前活动元素，吸引用户注意非常有用。
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    unselectedItemColor: AppColors.label,
    selectedItemColor: AppColors.primary,
  ),
  listTileTheme: const ListTileThemeData(
    tileColor: AppColors.white,
    titleTextStyle: TextStyle(fontSize: 14, color: AppColors.title),
    leadingAndTrailingTextStyle: TextStyle(fontSize: 14, color: AppColors.label),
  ),
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
    filled: true,
    isDense: true,
    outlineBorder: BorderSide.none,
    fillColor: AppColors.background,
    focusColor: AppColors.background,
    hoverColor: AppColors.background,
    prefixIconColor: AppColors.description,
    suffixIconColor: AppColors.description,
    prefixIconConstraints: BoxConstraints.tightFor(width: 34, height: 48),
    suffixIconConstraints: BoxConstraints.tightFor(width: 34, height: 48),
    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    border: inputBorder,
    errorBorder: inputBorder,
    enabledBorder: inputBorder,
    focusedBorder: inputBorder,
    disabledBorder: inputBorder,
    focusedErrorBorder: inputBorder,
  ),
  dialogTheme: const DialogThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
    insetPadding: EdgeInsets.all(24),
  ),
);
