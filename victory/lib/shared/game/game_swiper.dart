import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../apis/apis.dart';
import '../../components/network_image/network_image.dart';
import '../../models/banner.dart';
import '../../routes/app_pages.dart';
import '../../styles/styles.dart';

class SliverGameSwiper extends StatefulWidget {
  final int position;
  const SliverGameSwiper({super.key, required this.position});

  @override
  State<SliverGameSwiper> createState() => _SliverGameSwiperState();
}

class _SliverGameSwiperState extends State<SliverGameSwiper> {
  final banners = <BannerModel>[];

  @override
  void initState() {
    _queryAdList();
    super.initState();
  }

  void _queryAdList() async {
    final value = await Apis.app.queryAdList(queryParameters: {"type": "3", "position": widget.position});
    banners.addAll(value.data);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: banners.isEmpty ? const SizedBox.shrink() : buildBanner());
  }

  Widget buildBanner() {
    final single = banners.length == 1;
    const height = 264 / 2;

    if (single) {
      return Padding(
        padding: AppSize.pad_x_12,
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

  Widget buildItem(BannerModel banner) {
    return GestureDetector(
      onTap: banner.url.isEmpty ? null : () => Get.toNamed(AppRoutes.activityDetail, arguments: banner.url),
      child: SizedBox.expand(
        child: Material(
          color: AppColor.skeleton,
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          clipBehavior: Clip.hardEdge,
          child: VicNetworkImage(fit: BoxFit.fill, imageUrl: banner.image, colorBlendMode: BlendMode.src),
        ),
      ),
    );
  }
}
