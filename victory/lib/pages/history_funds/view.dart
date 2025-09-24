import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/action_sheet/action_sheet.dart';
import '../../models/fund_record.model.dart';
import '../../shared/date_view/data_view.dart';
import '../../theme/theme.dart';
import 'index.dart';

class VicFundHistory extends StatelessWidget {
  const VicFundHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HistoryFundsController());

    return Scaffold(
      extendBody: false,
      extendBodyBehindAppBar: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(32),
        child: ColoredBox(
          color: AppColors.background,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: VicActionSheet.single(
                initValue: controller.date.value,
                actions: controller.dateActions,
                onChanged: (value) {
                  controller.date.value = value;
                  controller.reset();
                },
              ),
            ),
          ),
        ),
      ),
      body: VicDataView<VicFundHisotryModel, HistoryFundsController>(
        controller: controller,
        enablePullUp: true,
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemBuilder: (context, index, item) => _Tile(item),
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  final VicFundHisotryModel record;

  const _Tile(this.record);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      titleAlignment: ListTileTitleAlignment.bottom,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      titleTextStyle: const TextStyle(fontSize: 12, color: AppColors.label),
      subtitleTextStyle: const TextStyle(fontSize: 14, color: AppColors.title),
      leadingAndTrailingTextStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: record.changeType == 2 ? AppColors.danger : AppColors.success,
      ),
      title: Padding(padding: const EdgeInsets.only(top: 8, bottom: 16.0), child: Text(record.time)),
      subtitle: Text(record.remark),
      trailing: Text('${record.changeType == 2 ? '-' : '+'}${record.money}'),
    );
  }
}
