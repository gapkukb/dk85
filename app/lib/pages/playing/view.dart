part of 'index.dart';

class PlayingView extends GetView<PlayingController> {
  const PlayingView({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("PlayingPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlayingController>(
      init: PlayingController(),
      id: "playing",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("Playing")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
