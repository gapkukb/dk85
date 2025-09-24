import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/action_sheet/action_sheet.dart';
import '../../models/game_record.model.dart';
import '../../shared/date_view/data_view.dart';
import 'index.dart';

class VicGameHistory extends StatelessWidget {
  const VicGameHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HistoryGamesController());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(32),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                VicActionSheet.single(
                  initValue: controller.date.value,
                  actions: controller.dateActions,
                  onChanged: (value) {
                    controller.date.value = value;
                    controller.reset();
                  },
                ),
                VicActionSheet.single(
                  initValue: controller.date.value,
                  actions: controller.dateActions,
                  onChanged: (value) {
                    controller.date.value = value;
                    controller.reset();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: VicDataView<VicGameHistoryModel, HistoryGamesController>(
          enablePullUp: true,
          controller: controller,
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemBuilder: (context, index, item) {
            return HistoryGamesTile(item);
          },
        ),
      ),
    );
  }
}
