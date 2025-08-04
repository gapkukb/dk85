import '../../widgets/game_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class FishingPage extends StatefulWidget {
  const FishingPage({super.key});

  @override
  State<FishingPage> createState() => _FishingPageState();
}

class _FishingPageState extends State<FishingPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _FishingViewGetX();
  }
}

class _FishingViewGetX extends GetView<FishingController> {
  const _FishingViewGetX({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(child: Text("FishingPage"));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FishingController>(
      init: FishingController(),
      id: "fishing",
      builder: (_) {
        return Scaffold(
          body: GridView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: 100,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              crossAxisCount: 3,
              childAspectRatio: 70 / 100,
            ),
            itemBuilder: (context, index) {
              return const GameCard();
            },
          ),
        );
      },
    );
  }
}
