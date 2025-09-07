import 'package:app/iconfont/index.dart';
import 'package:app/theme/index.dart';
import 'package:flutter/widgets.dart';

class FundState {
  final int state;
  late final String text;
  late final IconData icon;
  late final Color color;

  static const Map<int, Color> _colorMap = {1: AppColors.warn, 2: AppColors.success, 3: AppColors.warn};
  static const Map<int, String> _titleMap = {1: 'Pending Payment', 2: 'Payment Successful', 3: 'Payment Failed'};
  static const Map<int, IconData> _iconMap = {1: IconFont.pending, 2: IconFont.selected, 3: IconFont.fail};

  FundState({required this.state}) {
    // 状态。1=待处理；2=成功；3=失败
    text = _titleMap[state] ?? _titleMap[1]!;
    color = _colorMap[state] ?? _colorMap[1]!;
    icon = _iconMap[state] ?? _iconMap[1]!;
  }
}
