import 'package:intl/intl.dart';

NumberFormat _factory(int min, int max) {
  return NumberFormat.decimalPattern('en_US')
    ..minimumFractionDigits = min
    ..maximumFractionDigits = max;
}

// 固定2位小数格式化工具
final _fixedFormatter = _factory(2, 2);
// 弹性0-2位小数格式化工具
final _flexibleFormatter = _factory(0, 2);
// 0小数位格式化工具
final _zeroFormatter = _factory(0, 0);

/// Double 扩展 - 货币格式化工具
extension DoubleCurrencyExtension on double {
  /// 货币格式化
  ///
  /// [decimal] 如果不设置，则若金额为整数，不保留小数部分；若有小数位，则保留两位小数。
  ///
  /// 格式为 9,999,999.00
  String amount({int? decimal}) {
    if (decimal == null) return _flexibleFormatter.format(this);
    if (decimal == 2) return _fixedFormatter.format(this);
    if (decimal == 0) return _zeroFormatter.format(this);
    return _factory(decimal, decimal).format(this);
  }

  String currency({int? decimal}) {
    return amount(decimal: decimal) + 'MMK';
  }
}

/// int 扩展 - 货币格式化工具
extension IntCurrencyExtension on int {
  /// 货币格式化
  ///
  /// [decimal] 如果不设置，则若金额为整数，不保留小数部分；若有小数位，则保留两位小数。
  ///
  /// 格式为 9,999,999.00
  String amount({int? decimal}) {
    return toDouble().amount(decimal: decimal);
  }

  String currency({int? decimal}) {
    return toDouble().currency(decimal: decimal);
  }
}

/// num 扩展 - 货币格式化工具
extension NumCurrencyExtension on num {
  /// 货币格式化
  ///
  /// [decimal] 如果不设置，则若金额为整数，不保留小数部分；若有小数位，则保留两位小数。
  ///
  /// 格式为 9,999,999.00
  String amount({int? decimal}) {
    return toDouble().amount(decimal: decimal);
  }

  String currency({int? decimal}) {
    return toDouble().currency(decimal: decimal);
  }
}

/// string 扩展 - 货币格式化工具
extension StringCurrencyExtension on String {
  /// 货币格式化
  ///
  /// [decimal] 如果不设置，则若金额为整数，不保留小数部分；若有小数位，则保留两位小数。
  ///
  /// 格式为 9,999,999.00
  String amount({int? decimal}) {
    return (double.tryParse(this) ?? 0.00).amount(decimal: decimal);
  }

  String currency({int? decimal}) {
    return (double.tryParse(this) ?? 0.00).currency(decimal: decimal);
  }
}

void main(List<String> args) {}
