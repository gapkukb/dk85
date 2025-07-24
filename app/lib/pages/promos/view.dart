part of 'index.dart';

class PromosView extends GetView<PromosController> {
  const PromosView({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("PromosPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PromosController>(
      init: PromosController(),
      id: "promos",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("Promos")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
