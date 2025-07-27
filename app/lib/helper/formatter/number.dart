part of 'index.dart';

const locale = "km-KH";
// 固定两位小数
final _f1 = NumberFormat("#,###.00", locale);
// 最多两位小数
final _f2 = NumberFormat("#,###.##", locale);
// 没有小数
final _f3 = NumberFormat("#,###", locale);

/// 货币英文缩写
/// @example USD
final currencySymbol = _f1.currencySymbol;

final _c1 = NumberFormat.simpleCurrency(locale: locale);

/// 货币符号
/// @example $
final simpleCurrencySymbol = _c1.currencySymbol;

num _parse([final dynamic value = 0]) {
  if (value is num) return value;
  if (value is String) return num.tryParse(value) ?? 0;
  return 0;
}

String amountize([
  dynamic value = 0,
  final int decimal = 2,
  final bool fixedLength = true,
]) {
  value = _parse(value);

  if (decimal == 0) return _f3.format(value);
  if (fixedLength) return _f1.format(value);
  return _f2.format(value);
}

String currencize(
  dynamic value, {
  final int decimal = 2,
  final bool fixedLength = true,
  final int gap = 0,
}) {
  value = _parse(value);
  return _c1
      .format(value)
      .replaceAll(simpleCurrencySymbol, '$simpleCurrencySymbol${' ' * gap}');
}
