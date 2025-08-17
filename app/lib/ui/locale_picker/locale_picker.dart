import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '/i18n/index.dart';
import '/iconfont/index.dart';
import '/storage/index.dart';
import '/theme/index.dart';

class AKLocalePicker extends StatelessWidget {
  const AKLocalePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: MaterialButton(
        elevation: 0,
        highlightElevation: 0,
        onPressed: showLocalePicker,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        color: Colors.white,
        height: 28,
        shape: const StadiumBorder(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          spacing: 4,
          children: [
            const Icon(IconFont.i18n, size: 16, color: AppColors.primary),
            Obx(() => Text(I18n.getLocaleName(storage.locale.value), style: const TextStyle(fontSize: 12, color: AppColors.primary))),
            const Icon(IconFont.arrow_down_circle, size: 14, color: AppColors.primary),
          ],
        ),
      ),
    );
  }
}
