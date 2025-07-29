part of 'index.dart';

const _common = TextStyle(fontSize: 14, inherit: true);
final textTheme = TextTheme().copyWith(
  // bodyLarge: _common,
  // bodyMedium: _common,
  // bodySmall: _common,
  // displayLarge: _common,
  // displayMedium: _common,
  // displaySmall: _common,
  // headlineLarge: _common,
  // headlineMedium: _common,
  // headlineSmall: _common,
  // labelLarge: _common,
  // labelMedium: _common,
  // labelSmall: _common,
  // titleLarge: _common,
  // titleMedium: _common,
  // titleSmall: _common,
);

abstract class AppText {
  static const large = TextStyle(fontSize: 18);
  static const medium = TextStyle(fontSize: 16);
  static const normal = TextStyle(fontSize: 14);
  static const small = TextStyle(fontSize: 12);
  static const mini = TextStyle(fontSize: 10);

  static const title = TextStyle(
    fontSize: 14,
    color: AppColors.primary,
    fontWeight: FontWeight.bold,
  );
  static const label = TextStyle(fontSize: 12, color: AppColors.label);
  static const description = TextStyle(
    fontSize: 10,
    color: AppColors.description,
  );
}
