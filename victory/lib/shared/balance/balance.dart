import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/symbols.dart';
import '../../styles/colors.dart';

import '../../services/services.dart';

class Balance extends StatefulWidget {
  final int? fractionDigits;
  final String? prefix;
  final String? suffix;
  final String? decimalSeparator;
  final String? thousandSeparator;
  final EdgeInsets? amountPadding;
  final TextStyle? amountStyle;
  final Color? color;
  final int? wholeDigits;
  final bool? hideLeadingZeroes;
  final double refresherSize;
  final Color? refresherColor;
  final bool showFraction;

  final Widget Function(BuildContext context, Widget amount, Widget button, VoidCallback refresh) builder;
  const Balance({
    Key? key,
    this.color = Colors.white,
    required this.builder,
    this.fractionDigits,
    this.prefix,
    this.suffix,
    this.decimalSeparator,
    this.thousandSeparator,
    this.amountPadding,
    this.amountStyle,
    this.wholeDigits,
    this.hideLeadingZeroes,
    this.refresherColor,
    this.refresherSize = 18.0,
    this.showFraction = true,
  }) : super(key: key);

  @override
  _BalanceState createState() => _BalanceState();
}

class _BalanceState extends State<Balance> {
  num get balance => services.user.balance.value;
  final loading = false.obs;

  @override
  Widget build(BuildContext context) {
    final button = GestureDetector(
      onTap: refresh,
      child: Obx(
        () => Icon(
          Symbols.refresh,
          size: widget.refresherSize,
          color: widget.refresherColor ?? Colors.white,
        ).spin(duration: const Duration(seconds: 2), infinite: true, animate: loading.value),
      ),
    );

    final amount = Obx(
      () => AnimatedFlipCounter(
        value: widget.showFraction ? balance : balance.toInt(),
        fractionDigits: widget.showFraction ? 2 : 0,
        suffix: widget.suffix,
        prefix: widget.prefix,
        padding: widget.amountPadding ?? EdgeInsets.zero,
        decimalSeparator: widget.decimalSeparator ?? '.',
        textStyle: widget.amountStyle,
        wholeDigits: widget.wholeDigits ?? 1,
        thousandSeparator: widget.thousandSeparator,
        hideLeadingZeroes: widget.hideLeadingZeroes ?? false,
      ),
    );

    return widget.builder(context, amount, button, refresh);
  }

  void refresh() {
    loading.value = true;
    services.user.refreshBalance().whenComplete(() {
      loading.value = false;
    });
  }
}
