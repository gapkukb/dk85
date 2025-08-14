import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/theme/index.dart';

final pullUpIndicator = BuilderFooter(
  builder: (context, state) {
    double offset = state.offset;
    if (state.indicator.infiniteOffset != null && state.indicator.position == IndicatorPosition.locator && (state.mode != IndicatorMode.inactive || state.result == IndicatorResult.noMore)) {
      offset = state.actualTriggerOffset;
    }

    if (state.result == IndicatorResult.noMore) {
      return SizedBox(
        width: double.infinity,
        height: offset,
        child: const Row(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Divider(color: AppColors.description, thickness: 0.5, indent: 16)),
            Text("WE HAVE A BOTTOM", style: TextStyle(fontSize: 10, color: AppColors.description)),
            Expanded(child: Divider(color: AppColors.description, thickness: 0.5, endIndent: 16)),
          ],
        ),
      );
    }

    if (IndicatorMode.processing == state.mode) {
      return SizedBox(
        height: offset,
        child: const Center(child: CupertinoActivityIndicator(radius: 10)),
      );
    }

    return Container();
  },
  triggerOffset: 36,
  clamping: false,
);
