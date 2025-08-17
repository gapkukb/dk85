import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

import 'widgets/widgets.dart';

class SearchingView extends GetView<SearchingController> {
  const SearchingView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchingController>(
      builder: (_) {
        return Scaffold(
          body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [const AppBarWidget()];
            },
            // body: TabBarView(children: controller.state.kinds.map((item) => SearchingContentWidget(kind: item.value)).toList()),
            body: const Text("data"),
          ),
        );
      },
    );
  }
}
