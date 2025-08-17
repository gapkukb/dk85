import 'package:flutter/material.dart';

const _mini = 4.0;
const _small = 8.0;
const _normal = 16.0;
const _large = 32.0;
const _xlarge = 40.0;

class Gutter extends SizedBox {
  /// ---> 4.0 <----
  static const mini = SizedBox.square(dimension: _mini);

  /// ---> 8.0 <----
  static const small = SizedBox.square(dimension: _small);

  /// ---> 16.0 <----
  static const normal = SizedBox.square(dimension: _normal);

  /// ---> 32.0 <----
  static const large = SizedBox.square(dimension: _large);

  /// ---> 40.0 <----
  static const xlarge = SizedBox.square(dimension: _xlarge);

  /// ---> 4.0 <----
  static const mini_x = SizedBox(width: _mini);

  /// ---> 8.0 <----
  static const small_x = SizedBox(width: _small);

  /// ---> 16.0 <----
  static const normal_x = SizedBox(width: _normal);

  /// ---> 32.0 <----
  static const large_x = SizedBox(width: _large);

  /// ---> 40.0 <----
  static const xlarge_x = SizedBox(width: _xlarge);

  /// ---> 4.0 <----
  static const mini_y = SizedBox(height: _mini);

  /// ---> 8.0 <----
  static const small_y = SizedBox(height: _small);

  /// ---> 16.0 <----
  static const normal_y = SizedBox(height: _normal);

  /// ---> 32.0 <----
  static const large_y = SizedBox(height: _large);

  /// ---> 40.0 <----
  static const xlarge_y = SizedBox(height: _xlarge);

  const Gutter(double size, {super.key}) : super(width: size, height: size);
}
