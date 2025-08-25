import 'package:app/widgets/game/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class SearchingPage extends GetView<SearchingController> {
  const SearchingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchingController>(
      builder: (_) {
        return Scaffold(
          appBar: SearchingBar(),
          body: SafeArea(
            child: GridView.builder(
              padding: EdgeInsets.only(left: 12, right: 12, bottom: 12),
              itemCount: 100,
              gridDelegate: GameGridView.delegate,
              itemBuilder: (context, index) {
                return GameItemView();
              },
            ),
          ),
        );
      },
    );
  }
}
