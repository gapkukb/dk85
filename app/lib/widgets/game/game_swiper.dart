import 'package:app/apis/apis.dart';
import 'package:app/models/ad_list.model.dart';
import 'package:app/routes/app_pages.dart';
import 'package:app/theme/index.dart';
import 'package:app/views/activity_detail/activity_detail.dart';
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
    final value = await apis.app.queryAdList(queryParameters: {"type": "3", "position": widget.position});
    banners.addAll(value.data);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: banners.isEmpty ? nil : buildBanner());
  }

  Widget buildBanner() {
    final single = banners.length == 1;
    const height = 90.0;

    if (single) {
      return Padding(
        padding: Gutter.horizontal.normal,
        child: SizedBox(height: height, width: double.infinity, child: buildItem(banners.first)),
      );
    }

    return CarouselSlider(
      options: CarouselOptions(
        height: height,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        pauseAutoPlayOnTouch: true,
        viewportFraction: 0.8,
        enlargeFactor: 0.2,
        enlargeCenterPage: true,
      ),

      items: banners.map(buildItem).toList(),
    );
  }

  Widget buildItem(AdModel ad) {
    return GestureDetector(
      onTap: ad.url.isEmpty ? null : () => Get.toNamed(Routes.activityDetail, arguments: ad.url),
      child: SizedBox.expand(
        child: Material(
          color: AppColors.skeleton,
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          clipBehavior: Clip.hardEdge,
          child: NetworkPicture(fit: BoxFit.fill, imageUrl: ad.image, colorBlendMode: BlendMode.src),
        ),
      ),
    );
  }
}
