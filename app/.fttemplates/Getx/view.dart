part of 'index.dart';

class [FTName | pascalcase]View extends GetView<[FTName | pascalcase]Controller> {
  const [FTName | pascalcase]View({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("[FTName | pascalcase]Page"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<[FTName | pascalcase]Controller>(
      init: [FTName | pascalcase]Controller(),
      id: "[FTName]",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("[FTName | pascalcase]")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
