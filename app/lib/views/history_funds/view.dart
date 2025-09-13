import 'package:app/models/fund_record.model.dart';
import 'package:app/shared/chooser/index.dart';
import 'package:app/shared/date_view/data_view.dart';
import 'package:app/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'index.dart';

class HistoryFundsView extends StatelessWidget {
  const HistoryFundsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HistoryFundsController());

    return Scaffold(
      extendBody: false,
      extendBodyBehindAppBar: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(32),
        child: ColoredBox(
          color: AppColors.background,
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Chooser(
                initValue: controller.date.value,
                options: ChooserOptions(items: controller.dateOptions, prefixText: 'Date:'),
                onChanged: (value, current) {
                  controller.date.value = value;
                  controller.reset();
                },
              ),
            ),
          ),
        ),
      ),
      body: DataView<FundRecord, HistoryFundsController>(
        controller: controller,
        enablePullUp: true,
        separatorBuilder: (context, index) => SizedBox(height: 8),
        itemBuilder: (context, index, item) => _Tile(item),
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  final FundRecord record;

  const _Tile(this.record);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      titleAlignment: ListTileTitleAlignment.bottom,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      titleTextStyle: TextStyle(fontSize: 12, color: AppColors.label),
      subtitleTextStyle: TextStyle(fontSize: 14, color: AppColors.title),
      leadingAndTrailingTextStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: record.changeType == 2 ? AppColors.danger : AppColors.success),
      title: Padding(padding: const EdgeInsets.only(top: 8, bottom: 16.0), child: Text(record.time)),
      subtitle: Text(record.remark),
      trailing: Text('${record.changeType == 2 ? '-' : '+'}${record.money}'),
    );
  }
}
