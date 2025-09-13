import 'package:app/models/game_record.model.dart';
import 'package:app/shared/chooser/index.dart';
import 'package:app/shared/date_view/data_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'index.dart';

class HistoryGamesView extends StatelessWidget {
  const HistoryGamesView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HistoryGamesController());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(32),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Chooser<int>(
                  initValue: controller.date.value,
                  options: ChooserOptions(items: controller.dateOptions, prefixText: 'Date:'),
                  onChanged: (value, current) {
                    controller.date.value = value;
                    controller.reset();
                  },
                ),
                Chooser<String>(
                  initValue: controller.kind.value,
                  options: ChooserOptions(items: controller.kindsOptions, prefixText: 'Game:'),
                  onChanged: (value, current) {
                    controller.kind.value = value;
                    controller.reset();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: DataView<GameRecord, HistoryGamesController>(
          enablePullUp: true,
          controller: controller,
          separatorBuilder: (context, index) => SizedBox(height: 8),
          itemBuilder: (context, index, item) {
            return HistoryGamesTile(item);
          },
        ),
      ),
    );
  }
}
