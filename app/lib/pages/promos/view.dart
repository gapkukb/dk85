import 'package:cached_network_image/cached_network_image.dart';

import '../../iconfont/index.dart';
import '../../theme/index.dart';
import '../../ui/gutter/index.dart';
import '../../widgets/service_calling.dart';
import 'widgets/check_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class PromosPage extends GetView<PromosController> {
  const PromosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PromosController>(
      builder: (_) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: buildBalance(),
              actions: [IconButton(onPressed: () {}, icon: const ServiceCalling(size: 22))],
            ),
            body: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(child: CheckInWidget()),

                SliverPadding(
                  padding: const EdgeInsetsGeometry.all(12),
                  sliver: SliverList.separated(
                    itemCount: 10,
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 16);
                    },
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          controller.onTapPromoBanner(index);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          clipBehavior: Clip.antiAlias,
                          child: CachedNetworkImage(imageUrl: "https://img.okszckoo.com/upload/images/202504/c6a5ac2d-b29a-4e4b-b785-30632e33fd9e.jpg", height: 142, fit: BoxFit.cover),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  buildBalance() {
    return UnconstrainedBox(
      alignment: Alignment.centerLeft,
      child: Container(
        height: 32,
        padding: const EdgeInsets.all(2),
        decoration: const BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.all(Radius.circular(100))),
        child: Row(
          children: [
            Image.asset("assets/images/logo3.webp"),
            const Gutter(8),
            Column(
              spacing: 4,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("app.balance".tr, style: const TextStyle(fontSize: 10, height: 1, color: Colors.white)),
                Text(
                  "3000.00".tr,
                  style: const TextStyle(fontSize: 12, height: 1, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox.square(
              dimension: 36,
              child: IconButton(onPressed: () {}, icon: const Icon(IconFont.refresh), iconSize: 16, color: Colors.white, padding: const EdgeInsets.all(0)),
            ),
          ],
        ),
      ),
    );
  }
}
