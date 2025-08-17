part of 'index.dart';

class RecordsView extends GetView<RecordsController> {
  const RecordsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: GestureDetector(
          onTap: () {
            Get.bottomSheet(Menu(controller: controller));
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: [
              Obx(() => Text(controller.currentName)),
              const Icon(IconFont.arrow_down_circle, size: 18, color: AppColors.primary),
            ],
          ),
        ),
        titleTextStyle: const TextStyle(fontSize: 16, color: AppColors.title),
      ),
      body: Navigator(key: Get.nestedKey(2), initialRoute: Routes.recordsFunds, onGenerateRoute: controller.onGenerateRoute),
    );
  }
}
