import 'dart:math';

import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:app/iconfont/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Balance extends StatefulWidget {
  final double? spacing;
  final int? fractionDigits;
  final String? prefix;
  final String? suffix;
  final String? decimalSeparator;
  final String? thousandSeparator;
  final EdgeInsets? amountPadding;
  final TextStyle? amountStyle;
  final double amountSpacing;
  final TextStyle? trailingStyle;
  // final double? amountSize,
  final Color? color;
  final int? wholeDigits;
  final bool? hideLeadingZeroes;
  final double? refresherSize;
  final Color? refresherColor;
  final CrossAxisAlignment? crossAxisAlignment;
  final bool trailing;

  final Widget Function(BuildContext context, Widget amount, Widget refresher)?
  builder;
  const Balance({
    super.key,
    this.color = Colors.white,
    this.builder,
    this.spacing,
    this.fractionDigits,
    this.prefix,
    this.suffix,
    this.decimalSeparator,
    this.thousandSeparator,
    this.amountPadding,
    this.amountStyle,
    this.amountSpacing = 4.0,
    this.wholeDigits,
    this.hideLeadingZeroes,
    this.refresherColor,
    this.refresherSize,
    this.crossAxisAlignment,
    this.trailing = true,
    this.trailingStyle,
  });

  @override
  State<Balance> createState() => _BalanceState();
}

class _BalanceState extends State<Balance> {
  var amount = 1000;

  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final refresher = buildRefresher();
    final amount = buildAmount();

    if (widget.builder != null) {
      return widget.builder!(context, amount, refresher);
    }

    return Row(
      spacing: widget.spacing ?? 0,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: widget.crossAxisAlignment ?? CrossAxisAlignment.start,
      children: [amount, refresher],
    );
  }

  Widget buildRefresher() {
    return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            if (controller.isAnimating) return;
            controller.repeat();
            Future.delayed(3000.ms).whenComplete(() {
              setState(() {
                amount = Random().nextInt(1000000);
                controller.stop();
              });
            });
          },
          child: Icon(
            IconFont.refresh,
            size: widget.refresherSize ?? 14,
            color: widget.refresherColor ?? widget.color,
          ),
        )
        .animate(
          autoPlay: true,
          onInit: (controller_) {
            controller = controller_;
          },
        )
        .rotate(duration: 1500.ms);
  }

  Widget buildAmount() {
    final style = TextStyle(
      color: widget.color,
      // fontSize: 14,
      fontWeight: FontWeight.bold,
      height: 1,
    ).merge(widget.amountStyle);

    final counter = AnimatedFlipCounter(
      value: amount,
      fractionDigits: widget.fractionDigits ?? (amount < 99999 ? 2 : 0),
      suffix: widget.suffix,
      prefix: widget.prefix,
      padding: widget.amountPadding ?? EdgeInsets.zero,
      decimalSeparator: widget.decimalSeparator ?? '.',
      textStyle: style,
      wholeDigits: widget.wholeDigits ?? 1,
      thousandSeparator: widget.thousandSeparator,
      hideLeadingZeroes: widget.hideLeadingZeroes ?? false,
    );

    if (!widget.trailing) return counter;
    return Wrap(
      spacing: widget.amountSpacing,
      crossAxisAlignment: WrapCrossAlignment.end,
      children: [
        counter,
        Text("MMK", style: style.merge(widget.trailingStyle)),
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
