part of 'index.dart';

const _mini = 4.0;
const _small = 8.0;
const _normal = 12.0;
const _medium = 16.0;
const _large = 20.0;
const _xlarge = 24.0;

class _Inner {
  /// ---------[ 4.0 ] ---------
  late final EdgeInsets mini;

  /// ---------[ 8.0 ] ---------
  late final EdgeInsets small;

  /// ---------[ 12.0 ] ---------
  late final EdgeInsets normal;

  /// ---------[ 16.0 ] ---------
  late final EdgeInsets medium;

  /// ---------[ 20.0 ] ---------
  late final EdgeInsets large;

  /// ---------[ 24.0 ] ---------
  late final EdgeInsets xlarge;

  _Inner(EdgeInsets Function(double value) factor) {
    mini = factor(_mini);

    small = factor(_small);

    normal = factor(_normal);

    medium = factor(_medium);

    large = factor(_large);

    xlarge = factor(_xlarge);
  }
}

abstract class Gutter {
  static final all = _Inner((value) => EdgeInsets.all(value));

  static final horizontal = _Inner(
    (value) => EdgeInsets.symmetric(horizontal: value),
  );
  static final vertical = _Inner(
    (value) => EdgeInsets.symmetric(vertical: value),
  );

  static final left = _Inner((value) => EdgeInsets.only(left: value));
  static final right = _Inner((value) => EdgeInsets.only(right: value));
  static final top = _Inner((value) => EdgeInsets.only(top: value));
  static final bottom = _Inner((value) => EdgeInsets.only(bottom: value));

  static final bottomLess = _Inner(
    (value) => EdgeInsets.fromLTRB(value, value, value, 0),
  );
  static final topLess = _Inner(
    (value) => EdgeInsets.fromLTRB(value, 0, value, value),
  );
  static final leftLess = _Inner(
    (value) => EdgeInsets.fromLTRB(0, value, value, value),
  );
  static final rightLess = _Inner(
    (value) => EdgeInsets.fromLTRB(value, value, 0, value),
  );
}
