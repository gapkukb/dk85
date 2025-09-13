part of 'index.dart';

const inputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(8)),
  borderSide: BorderSide(width: 0, style: BorderStyle.none),
);
final lightTheme = ThemeData(
  brightness: Brightness.light, //深色还是浅色
  // primarySwatch: MaterialColor(primary, swatch), //主题颜色样本
  primaryColor: Colors.white, //主色，决定导航栏颜色
  cardColor: Colors.white, //卡片颜色
  dividerColor: Colors.white, //分割线颜色
  canvasColor: Colors.white, //这是整个屏幕或应用程序窗口的背景色。它定义了所有其他 UI 元素的基色。
  scaffoldBackgroundColor: AppColors.background, //脚手架本身的背景颜色，包括应用栏、正文内容区域和底部导航栏（如果存在）。
  highlightColor: Colors.transparent, //用户点击并按住 Widget 时短暂显示的颜色。它为用户提供了交互已注册的视觉反馈。
  focusColor: Colors.transparent, //有焦点的颜色，这意味着该元素将接收键盘输入。这对于突出显示当前活动元素，吸引用户注意非常有用。
  // primaryColor: Colors.white,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xffff5800),
    onPrimary: Color(0xff111111),
    secondary: Color(0xFFEFF3F3),
    onSecondary: Color(0xFF322942),
    error: Colors.redAccent,
    onError: Colors.white,
    surface: Colors.white,
    onSurface: Color(0xff111111),
  ),
  // textTheme: textTeme,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.background,
    scrolledUnderElevation: 0,
    titleTextStyle: _style.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(type: BottomNavigationBarType.fixed, unselectedItemColor: AppColors.label, selectedItemColor: AppColors.primary),
  listTileTheme: ListTileThemeData(
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
);
