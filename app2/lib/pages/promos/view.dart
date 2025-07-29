import '../../iconfont/index.dart';
import 'widgets/claim_center.dart';
import '../../widgets/account_balance.dart';
import '../../widgets/network_picture.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class PromosPage extends GetView<PromosController> {
  const PromosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PromosController>(
      builder: (_) {
        return SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Scaffold(
              body: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(child: AccountBalance()),
                  SliverPadding(padding: EdgeInsetsGeometry.all(4)),
                  SliverToBoxAdapter(child: CheckInWidget()),
                  SliverPadding(padding: EdgeInsetsGeometry.all(4)),
                  SliverList.separated(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(4),
                        child: NetworkPicture(
                          height: 84,
                          imageUrl:
                              "https://img.okszckoo.com/upload/images/202504/c6a5ac2d-b29a-4e4b-b785-30632e33fd9e.jpg",
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 4),
                  ),

                  // SliverPadding(padding: EdgeInsetsGeometry.only(bottom: 44)),
                ],
              ),
              floatingActionButton: FloatingActionButton.small(
                onPressed: () {
                  Get.bottomSheet(ClaimCenterWidget());
                },
                child: Icon(IconFont.liwu),
              ),
            ),
          ),
        );
      },
    );
  }
}
