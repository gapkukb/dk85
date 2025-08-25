import 'package:app/widgets/game/index.dart';
import 'package:app/widgets/network_picture.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'index.dart';

class HotView extends StatefulWidget {
  const HotView({super.key});

  @override
  _HotViewState createState() => _HotViewState();
}

class _HotViewState extends State<HotView> with AutomaticKeepAliveClientMixin {
  final controller = HotController();
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SafeArea(
        child: SmartRefresher(
          controller: controller.refresher,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: buildSwiper()),
              buildGrid(),
            ],
          ),
        ),
      ),
    );
  }

  buildSwiper() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 90.0,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        pauseAutoPlayOnTouch: true,
        viewportFraction: 0.8,
        enlargeFactor: 0.2,
        enlargeCenterPage: true,
        // enableInfiniteScroll: false,
      ),

      items: [1, 2].map((i) {
        return PhysicalModel(
          color: Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          clipBehavior: Clip.hardEdge,
          child: NetworkPicture(
            imageUrl:
                "https://c66hkp.s3.ap-east-1.amazonaws.com/57e4d3ea-9655-41b1-8c9f-31f187fd880f1",
          ),
        );
      }).toList(),
    );
  }

  buildGrid() {
    return SliverPadding(
      padding: EdgeInsets.all(8),
      sliver: SliverGrid.builder(
        itemCount: 42,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 67 / 100,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          return GameItemView();
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
