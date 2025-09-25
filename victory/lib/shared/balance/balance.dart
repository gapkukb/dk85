import 'package:animate_do/animate_do.dart';
import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:victory/theme/colors.dart';
import 'package:victory/services/services.dart';
import 'package:victory/shared/logger/logger.dart';

class VicBalanceBuilder extends StatefulWidget {
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
  const VicBalanceBuilder({
    super.key,
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
  });

  @override
  _VicBalanceBuilderState createState() => _VicBalanceBuilderState();
}

class _VicBalanceBuilderState extends State<VicBalanceBuilder> {
  num get balance => services.user.balance.value;
  final loading = false.obs;

  @override
  Widget build(BuildContext context) {
    final button = Listener(
      // onTap: refresh,
      onPointerUp: (_) => refresh(),
      child: Obx(
        () => Icon(
          Symbols.refresh,
          size: widget.refresherSize,
          color: widget.refresherColor ?? Colors.white,
        ).spin(duration: const Duration(seconds: 2), infinite: true, animate: loading.value),
      ),
    );

    final amount = Obx(
      () => AnimatedDigitWidget(
        duration: const Duration(seconds: 1),
        curve: Curves.bounceInOut,
        value: widget.showFraction ? balance : balance.toInt(),
        fractionDigits: widget.showFraction ? 2 : 0,
        suffix: widget.suffix,
        prefix: widget.prefix,
        enableSeparator: true,
        // padding: widget.amountPadding ?? EdgeInsets.zero,
        decimalSeparator: widget.decimalSeparator ?? '.',
        textStyle: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.white).merge(widget.amountStyle),
        // wholeDigits: widget.wholeDigits ?? 1,
        // thousandSeparator: widget.thousandSeparator,
        // hideLeadingZeroes: widget.hideLeadingZeroes ?? false,
      ),
    );

    return widget.builder(context, amount, button, refresh);
  }

  void refresh() {
    Logger.debug('refresh');
    loading.value = true;
    services.user.queryBalance().whenComplete(() {
      loading.value = false;
    });
  }
}
