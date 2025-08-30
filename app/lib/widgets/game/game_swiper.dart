import 'package:app/apis/index.dart';
import 'package:app/models/ad_list.model.dart';
import 'package:app/theme/index.dart';
import 'package:app/widgets/network_picture.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nil/nil.dart';

class SliverGameSwiper extends StatefulWidget {
  final int position;
  const SliverGameSwiper({super.key, required this.position});

  @override
  State<SliverGameSwiper> createState() => _SliverGameSwiperState();
}

class _SliverGameSwiperState extends State<SliverGameSwiper> {
  final banners = <AdModel>[];

  @override
  void initState() {
    _queryAdList();
    super.initState();
  }

  void _queryAdList() async {
    final value = await queryAdList(
      payload: {"type": "3", "position": widget.position},
    );
    banners.addAll(value ?? []);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: banners.isEmpty ? nil : buildBanner());
  }

  Widget buildBanner() {
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

      items: banners.map((i) {
        return SizedBox.expand(
          child: Material(
            color: AppColors.skeleton,
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            clipBehavior: Clip.hardEdge,
            child: NetworkPicture(
              fit: BoxFit.fill,
              imageUrl: i.image,
              colorBlendMode: BlendMode.src,
            ),
          ),
        );
      }).toList(),
    );
  }
}
