part of 'index.dart';

class AnnouncementView extends GetView<AnnouncementController> {
  const AnnouncementView({super.key});

  @override
  Widget build(BuildContext context) {
    final appService = Get.put<AppService>(AppService());

    return GetBuilder<AnnouncementController>(
      init: AnnouncementController(),
      id: "announcement",
      builder: (_) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          backgroundColor: Colors.transparent,
          clipBehavior: Clip.antiAlias,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildHeader(),
              Material(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
                clipBehavior: Clip.antiAlias,
                child: Theme(
                  data: Theme.of(context).copyWith(dividerColor: const Color(0xfff1f1f1)),
                  child: Container(
                    color: Colors.white,
                    height: 56 * 6,
                    child: const SingleChildScrollView(
                      // controller: controller.,
                      padding: EdgeInsets.all(0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Annoucementitem(),
                          Annoucementitem(),
                          Annoucementitem(),
                          Annoucementitem(),
                          Annoucementitem(),
                          Annoucementitem(),
                          Annoucementitem(),
                          Annoucementitem(),
                          Annoucementitem(),
                          Annoucementitem(),
                          Annoucementitem(),
                          Annoucementitem(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Gutter.normal,
              IconButton.filled(
                color: AppColors.primary,
                style: IconButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Symbols.close),
              ),
            ],
          ),
        );
      },
    );
  }

  buildHeader() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 50,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        color: AppColors.primary,
      ),
      child: Text(
        "announcement".tr,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white, height: 2.5),
      ),
    );
  }
}
