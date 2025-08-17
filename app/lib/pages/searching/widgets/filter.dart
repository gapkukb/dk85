import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/index.dart';
import '../../../ui/button/index.dart';
import '/iconfont/index.dart';
import '../index.dart';

class SearchingFilterWidget extends GetView<SearchingController> {
  const SearchingFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final filters = await Get.bottomSheet<List<String>>(buildPickerView(), isScrollControlled: true);
        if (filters == null) return;
        controller.state.platforms.value = filters;
        controller.search();
      },
      icon: const Icon(IconFont.guolvqi),
    );
  }

  show() {
    final state = controller.state;
    final filters = state.platforms.toList().obs;

    return Get.bottomSheet<List<String>>(
      Scaffold(
        backgroundColor: Colors.white,
        body: ListView.builder(
          itemCount: state.allPlatorm.length,
          itemBuilder: (context, index) {
            return Obx(() {
              final option = state.allPlatorm[index];
              final selected = filters.contains(option.value);

              return CheckboxListTile(
                selected: selected,
                title: Text(option.name),
                value: selected,
                controlAffinity: ListTileControlAffinity.trailing,
                checkColor: AppColors.description,
                onChanged: (value) {
                  // "全部" 和其他选项互斥
                  final f = filters.toList();
                  if (index == 0) {
                    if (value == true) {
                      f.clear();
                      f.add(option.value);
                    }
                  } else {
                    f.remove('-1');
                    if (value == true) {
                      f.add(option.value);
                    } else {
                      f.remove(option.value);
                    }
                  }

                  filters.value = f;
                },
              );
            });
          },
        ),

        bottomNavigationBar: AKButton(
          color: AKButton.danger,
          radius: 0,
          onPressed: () {
            Get.back(result: filters);
          },
          text: "app.filter".tr,
        ),
      ),
      isScrollControlled: true,
    );
  }

  buildPickerView() {
    final state = controller.state;
    final filters = state.platforms.toList().obs;

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: Get.height / 2),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView.builder(
          itemCount: state.allPlatorm.length,
          itemBuilder: (context, index) {
            return Obx(() {
              final option = state.allPlatorm[index];
              final selected = filters.contains(option.value);

              return CheckboxListTile(
                selected: selected,
                title: Text(option.name),
                value: selected,
                controlAffinity: ListTileControlAffinity.trailing,
                onChanged: (value) {
                  // "全部" 和其他选项互斥
                  final f = filters.toList();
                  if (index == 0) {
                    if (value == true) {
                      f.clear();
                      f.add(option.value);
                    }
                  } else {
                    f.remove('-1');
                    if (value == true) {
                      f.add(option.value);
                    } else {
                      f.remove(option.value);
                    }
                  }

                  filters.value = f;
                },
              );
            });
          },
        ),

        bottomNavigationBar: AKButton(
          color: AKButton.danger,
          radius: 0,
          onPressed: () {
            Get.back(result: filters);
          },
          text: "app.filter".tr,
        ),
      ),
    );
  }
}
