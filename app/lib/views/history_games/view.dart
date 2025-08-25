import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class HistoryGamesView extends StatefulWidget {
  const HistoryGamesView({super.key});

  @override
  State<HistoryGamesView> createState() => _HistoryGamesViewState();
}

class _HistoryGamesViewState extends State<HistoryGamesView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _HistoryGamesViewGetX();
  }
}

class _HistoryGamesViewGetX extends GetView<HistoryGamesController> {
  const _HistoryGamesViewGetX({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(child: Text("HistoryGamesPage"));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryGamesController>(
      init: HistoryGamesController(),
      id: "history_games",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text("history_games"),
          ),
          body: SafeArea(child: _buildView()),
        );
      },
    );
  }
}
