import 'package:flutter/material.dart';

abstract class AppGutter {

  static const size_0 = 0.0;
  static const size_4 = 4.0;
  static const size_8 = 8.0;
  static const size_12 = 12.0;
  static const size_16 = 16.0;
  static const size_20 = 20.0;
  static const size_24 = 24.0;
  static const size_28 = 28.0;
  static const size_32 = 32.0;
  static const size_36 = 36.0;
  static const size_40  = 40.0;

	static const zero = EdgeInsets.zero;

	static const all_4 = const EdgeInsets.all(4);
  static const all_8 = const EdgeInsets.all(8);
  static const all_12 = const EdgeInsets.all(12);
  static const all_16 = const EdgeInsets.all(16);
  static const all_20 = const EdgeInsets.all(20);
  static const all_24 = const EdgeInsets.all(24);
  static const all_28 = const EdgeInsets.all(28);
  static const all_32 = const EdgeInsets.all(32);
  static const all_36 = const EdgeInsets.all(36);
  static  const all_40  = const EdgeInsets.all(40);
  
	static const x_4 = const EdgeInsets.symmetric(horizontal: 4);
  static const x_8 = const EdgeInsets.symmetric(horizontal: 8);
  static const x_12 = const EdgeInsets.symmetric(horizontal: 12);
  static const x_16 = const EdgeInsets.symmetric(horizontal: 16);
  static const x_20 = const EdgeInsets.symmetric(horizontal: 20);
  static const x_24 = const EdgeInsets.symmetric(horizontal: 24);
  static const x_28 = const EdgeInsets.symmetric(horizontal: 28);
  static const x_32 = const EdgeInsets.symmetric(horizontal: 32);
  static const x_36 = const EdgeInsets.symmetric(horizontal: 36);
  static  const x_40  = const EdgeInsets.symmetric(horizontal: 40);
  
	static const y_4 = const EdgeInsets.symmetric(vertical: 4);
  static const y_8 = const EdgeInsets.symmetric(vertical: 8);
  static const y_12 = const EdgeInsets.symmetric(vertical: 12);
  static const y_16 = const EdgeInsets.symmetric(vertical: 16);
  static const y_20 = const EdgeInsets.symmetric(vertical: 20);
  static const y_24 = const EdgeInsets.symmetric(vertical: 24);
  static const y_28 = const EdgeInsets.symmetric(vertical: 28);
  static const y_32 = const EdgeInsets.symmetric(vertical: 32);
  static const y_36 = const EdgeInsets.symmetric(vertical: 36);
  static  const y_40  = const EdgeInsets.symmetric(vertical: 40);
  
	static const left_4 = const EdgeInsets.only(left: 4);
  static const left_8 = const EdgeInsets.only(left: 8);
  static const left_12 = const EdgeInsets.only(left: 12);
  static const left_16 = const EdgeInsets.only(left: 16);
  static const left_20 = const EdgeInsets.only(left: 20);
  static const left_24 = const EdgeInsets.only(left: 24);
  static const left_28 = const EdgeInsets.only(left: 28);
  static const left_32 = const EdgeInsets.only(left: 32);
  static const left_36 = const EdgeInsets.only(left: 36);
  static  const left_40  = const EdgeInsets.only(left: 40);
  
	static const right_4 = const EdgeInsets.only(right: 4);
  static const right_8 = const EdgeInsets.only(right: 8);
  static const right_12 = const EdgeInsets.only(right: 12);
  static const right_16 = const EdgeInsets.only(right: 16);
  static const right_20 = const EdgeInsets.only(right: 20);
  static const right_24 = const EdgeInsets.only(right: 24);
  static const right_28 = const EdgeInsets.only(right: 28);
  static const right_32 = const EdgeInsets.only(right: 32);
  static const right_36 = const EdgeInsets.only(right: 36);
  static  const right_40  = const EdgeInsets.only(right: 40);
  
	static const top_4 = const EdgeInsets.only(top: 4);
  static const top_8 = const EdgeInsets.only(top: 8);
  static const top_12 = const EdgeInsets.only(top: 12);
  static const top_16 = const EdgeInsets.only(top: 16);
  static const top_20 = const EdgeInsets.only(top: 20);
  static const top_24 = const EdgeInsets.only(top: 24);
  static const top_28 = const EdgeInsets.only(top: 28);
  static const top_32 = const EdgeInsets.only(top: 32);
  static const top_36 = const EdgeInsets.only(top: 36);
  static  const top_40  = const EdgeInsets.only(top: 40);
  
	static const bottom_4 = const EdgeInsets.only(bottom: 4);
  static const bottom_8 = const EdgeInsets.only(bottom: 8);
  static const bottom_12 = const EdgeInsets.only(bottom: 12);
  static const bottom_16 = const EdgeInsets.only(bottom: 16);
  static const bottom_20 = const EdgeInsets.only(bottom: 20);
  static const bottom_24 = const EdgeInsets.only(bottom: 24);
  static const bottom_28 = const EdgeInsets.only(bottom: 28);
  static const bottom_32 = const EdgeInsets.only(bottom: 32);
  static const bottom_36 = const EdgeInsets.only(bottom: 36);
  static  const bottom_40  = const EdgeInsets.only(bottom: 40);
  
	static const leftless_4 = const EdgeInsets.fromLTRB(0, 4, 4, 4);
  static const leftless_8 = const EdgeInsets.fromLTRB(0, 8, 8, 8);
  static const leftless_12 = const EdgeInsets.fromLTRB(0, 12, 12, 12);
  static const leftless_16 = const EdgeInsets.fromLTRB(0, 16, 16, 16);
  static const leftless_20 = const EdgeInsets.fromLTRB(0, 20, 20, 20);
  static const leftless_24 = const EdgeInsets.fromLTRB(0, 24, 24, 24);
  static const leftless_28 = const EdgeInsets.fromLTRB(0, 28, 28, 28);
  static const leftless_32 = const EdgeInsets.fromLTRB(0, 32, 32, 32);
  static const leftless_36 = const EdgeInsets.fromLTRB(0, 36, 36, 36);
  static  const leftless_40  = const EdgeInsets.fromLTRB(0, 40, 40, 40);
  
	static const rightless_4 = const EdgeInsets.fromLTRB(4, 4, 0, 4);
  static const rightless_8 = const EdgeInsets.fromLTRB(8, 8, 0, 8);
  static const rightless_12 = const EdgeInsets.fromLTRB(12, 12, 0, 12);
  static const rightless_16 = const EdgeInsets.fromLTRB(16, 16, 0, 16);
  static const rightless_20 = const EdgeInsets.fromLTRB(20, 20, 0, 20);
  static const rightless_24 = const EdgeInsets.fromLTRB(24, 24, 0, 24);
  static const rightless_28 = const EdgeInsets.fromLTRB(28, 28, 0, 28);
  static const rightless_32 = const EdgeInsets.fromLTRB(32, 32, 0, 32);
  static const rightless_36 = const EdgeInsets.fromLTRB(36, 36, 0, 36);
  static  const rightless_40  = const EdgeInsets.fromLTRB(40, 40, 0, 40);
  
	static const topless_4 = const EdgeInsets.fromLTRB(4, 0, 4, 4);
  static const topless_8 = const EdgeInsets.fromLTRB(8, 0, 8, 8);
  static const topless_12 = const EdgeInsets.fromLTRB(12, 0, 12, 12);
  static const topless_16 = const EdgeInsets.fromLTRB(16, 0, 16, 16);
  static const topless_20 = const EdgeInsets.fromLTRB(20, 0, 20, 20);
  static const topless_24 = const EdgeInsets.fromLTRB(24, 0, 24, 24);
  static const topless_28 = const EdgeInsets.fromLTRB(28, 0, 28, 28);
  static const topless_32 = const EdgeInsets.fromLTRB(32, 0, 32, 32);
  static const topless_36 = const EdgeInsets.fromLTRB(36, 0, 36, 36);
  static  const topless_40  = const EdgeInsets.fromLTRB(40, 0, 40, 40);
  
	static const bottomless_4 = const EdgeInsets.fromLTRB(4, 4, 4, 0);
  static const bottomless_8 = const EdgeInsets.fromLTRB(8, 8, 8, 0);
  static const bottomless_12 = const EdgeInsets.fromLTRB(12, 12, 12, 0);
  static const bottomless_16 = const EdgeInsets.fromLTRB(16, 16, 16, 0);
  static const bottomless_20 = const EdgeInsets.fromLTRB(20, 20, 20, 0);
  static const bottomless_24 = const EdgeInsets.fromLTRB(24, 24, 24, 0);
  static const bottomless_28 = const EdgeInsets.fromLTRB(28, 28, 28, 0);
  static const bottomless_32 = const EdgeInsets.fromLTRB(32, 32, 32, 0);
  static const bottomless_36 = const EdgeInsets.fromLTRB(36, 36, 36, 0);
  static  const bottomless_40  = const EdgeInsets.fromLTRB(40, 40, 40, 0);
  }