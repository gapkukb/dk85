part of 'index.dart';

class RecordsFundsView extends GetView<RecordsFundsController> {
  const RecordsFundsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(32),
      //   child: Center(
      //     child: ElevatedButton.icon(onPressed: () {}, label: Obx(() => Text(controller.currentName)), iconAlignment: IconAlignment.end, icon: const Icon(IconFont.arrow_down_filled)),
      //   ),
      // ),
      body: EasyRefresh(
        onRefresh: () async {},
        onLoad: () async {
          await Future.delayed(const Duration(seconds: 3));
          return IndicatorResult.noMore;
        },
        child: buildView(context),
      ),
    );
  }

  buildView(BuildContext context) {
    return ListView(
      // physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.all(12),
      children: ListTile.divideTiles(
        context: context,
        color: AppColors.border,
        tiles: [
          const RecordWidget(),
          const RecordWidget(),
          const RecordWidget(),
          const RecordWidget(),
          const RecordWidget(),
          const RecordWidget(),
          const RecordWidget(),
          const RecordWidget(),
          const RecordWidget(),
          const RecordWidget(),
          const RecordWidget(),
          const RecordWidget(),
          const RecordWidget(),
          const RecordWidget(),
          const RecordWidget(),
          const RecordWidget(),
          const RecordWidget(),
          const RecordWidget(),
          const RecordWidget(),
          const RecordWidget(),
          const RecordWidget(),
          const RecordWidget(),
          const RecordWidget(),
          const RecordWidget(),
          const RecordWidget(),
        ],
      ).toList(),
    );
  }
}
