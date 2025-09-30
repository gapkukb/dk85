import 'package:intl/intl.dart';

// 固定2位小数格式化工具
final _f = NumberFormat.compact().format;

/// Double 扩展 - 货币格式化工具
extension DoubleCurrencyExtension on double {
  String compact() {
    return _f(this);
  }
}

/// int 扩展 - 货币格式化工具
extension IntCurrencyExtension on int {
  String compact() {
    return _f(this);
  }
}

/// num 扩展 - 货币格式化工具
extension NumCurrencyExtension on num {
  String compact() {
    return _f(this);
  }
}

/// string 扩展 - 货币格式化工具
extension StringCurrencyExtension on String {
  String compact() {
    return _f(this);
  }
}
