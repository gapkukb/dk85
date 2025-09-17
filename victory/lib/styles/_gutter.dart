part of 'styles.dart';

// 间距类，以4为单位
class _Generator {
  /// ---------> 4px <--------
  late final EdgeInsets x1;

  /// ---------> 8px <--------
  late final EdgeInsets x2;

  /// ---------> 12px <--------
  late final EdgeInsets x3;

  /// ---------> 16px <--------
  late final EdgeInsets x4;

  /// ---------> 20px <--------
  late final EdgeInsets x5;

  /// ---------> 24px <--------
  late final EdgeInsets x6;

  /// ---------> 28px <--------
  late final EdgeInsets x7;

  /// ---------> 32px <--------
  late final EdgeInsets x8;

  /// ---------> 36px <--------
  late final EdgeInsets x9;

  /// ---------> 40px <--------
  late final EdgeInsets x10;

  /// ---------> 4px <--------
  late final EdgeInsets px04;

  /// ---------> 8px <--------
  late final EdgeInsets px08;

  /// ---------> 12px <--------
  late final EdgeInsets px12;

  /// ---------> 16px <--------
  late final EdgeInsets px16;

  /// ---------> 20px <--------
  late final EdgeInsets px20;

  /// ---------> 24px <--------
  late final EdgeInsets px24;

  /// ---------> 28px <--------
  late final EdgeInsets px28;

  /// ---------> 32px <--------
  late final EdgeInsets px32;

  /// ---------> 36px <--------
  late final EdgeInsets px36;

  /// ---------> 40px <--------
  late final EdgeInsets px40;

  _Generator(EdgeInsets Function(double value) generator) {
    px04 = x1 = generator(4.0 * 1);
    px08 = x2 = generator(4.0 * 2);
    px12 = x3 = generator(4.0 * 3);
    px16 = x4 = generator(4.0 * 4);
    px20 = x5 = generator(4.0 * 5);
    px24 = x6 = generator(4.0 * 6);
    px28 = x7 = generator(4.0 * 7);
    px32 = x8 = generator(4.0 * 8);
    px36 = x9 = generator(4.0 * 9);
    px40 = x10 = generator(4.0 * 10);
  }
}

class Gutter {
  final double px04 = (4.0 * 1);
  final double px08 = (4.0 * 2);
  final double px12 = (4.0 * 3);
  final double px16 = (4.0 * 4);
  final double px20 = (4.0 * 5);
  final double px24 = (4.0 * 6);
  final double px28 = (4.0 * 7);
  final double px32 = (4.0 * 8);
  final double px36 = (4.0 * 9);
  final double px40 = (4.0 * 10);

  final all = _Generator(EdgeInsets.all);
  final horizontal = _Generator((value) => EdgeInsets.symmetric(horizontal: value));
  final vertical = _Generator((value) => EdgeInsets.symmetric(vertical: value));
  final left = _Generator((value) => EdgeInsets.only(left: value));
  final right = _Generator((value) => EdgeInsets.only(right: value));
  final top = _Generator((value) => EdgeInsets.only(top: value));
  final bottom = _Generator((value) => EdgeInsets.only(bottom: value));
  final leftless = _Generator((value) => EdgeInsets.fromLTRB(0, value, value, value));
  final rightless = _Generator((value) => EdgeInsets.fromLTRB(value, value, 0, value));
  final topless = _Generator((value) => EdgeInsets.fromLTRB(value, 0, value, value));
  final bottomless = _Generator((value) => EdgeInsets.fromLTRB(value, value, value, 0));

  /// 整个页面使用的间距 left 12 right 12 top 0 bottom 12
  final page = const EdgeInsets.fromLTRB(12, 0, 12, 12);
}
