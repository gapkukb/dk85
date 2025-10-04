import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:victory/components/button/button.dart';
import 'package:victory/components/tile/tile.dart';
import 'package:victory/helper/native_image.dart';
import 'package:victory/routes/app_pages.dart';
import 'package:victory/shared/balance_card/balance_card.dart';
import 'package:victory/services/services.dart';
import 'package:victory/theme/theme.dart';
import 'package:victory/pages/customer_service/customer_service.dart';
import 'package:victory/pages/profile/index.dart';

class VicProfilePage extends StatefulWidget {
  const VicProfilePage({super.key});

  @override
  State<VicProfilePage> createState() => _VicProfilePageState();
}

class _VicProfilePageState extends State<VicProfilePage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _ProfileViewGetX();
  }
}

class _ProfileViewGetX extends GetView<VicProfileController> {
  const _ProfileViewGetX({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VicProfileController>(
      init: VicProfileController(),
      id: "profile",
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            child: ListView(
              padding: AppSizes.pad_t_12,
              children: [
                const SizedBox(height: 0),
                buildAppBar(),
                // SizedBox(height: 16),
                buildNavs(context),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildAppBar() {
    var align = Align(
      alignment: const Alignment(-1, 2),
      child: Row(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CircleAvatar(radius: 30, backgroundImage: FileImage(File(NativeImage.logoLight))),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(color: const Color(0xfffffac4), borderRadius: BorderRadius.circular(100)),
            child: Text(
              'VIP${services.user.info.value.gradeName}',
              style: const TextStyle(fontSize: 12, fontStyle: FontStyle.italic, color: AppColors.primary, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: VicBalanceCard(
            height: 200,
            before: const SizedBox(height: 30),
            after: Row(
              spacing: 16,
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: VicButton(
                    onPressed: services.app.toFundsPage,
                    rounded: true,
                    text: 'app.deposit'.tr,
                    backgroundColor: AppColors.white,
                    color: AppColors.highlight,
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: VicButton(
                    onPressed: () {
                      services.app.toFundsPage(1);
                    },
                    rounded: true,
                    outlined: true,
                    text: 'app.withdraw'.tr,
                    color: Colors.white,
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(left: 24, top: 0, child: align),
      ],
    );
  }

  Widget buildNavs(BuildContext context) {
    return ListTileTheme(
      data: const ListTileThemeData(
        minTileHeight: 56,
        iconColor: AppColors.primary,
        titleTextStyle: TextStyle(
          fontSize: 14,
          color: AppColors.title,
          // fontWeight: FontWeight.bold,
        ),
      ),

      child: CupertinoListSection.insetGrouped(
        margin: const EdgeInsets.all(12),
        additionalDividerMargin: 0,
        separatorColor: AppColors.border,
        children: [
          VicTile(titleText: "acc.title".tr, to: AppRoutes.account),
          VicTile(titleText: "rebate.title".tr, to: AppRoutes.rebate),
          VicTile(
            titleText: "vip.title".tr,
            titleTextStyle: const TextStyle(color: AppColors.highlight, fontWeight: FontWeight.bold),
            to: AppRoutes.vip,
          ),
          VicTile(titleText: "fav.title".tr, to: AppRoutes.favorites),
          // AKTile(titleText: "page.invitation".tr, to: Routes.invitation),
          VicTile(titleText: "app.service".tr, onTap: VicCustomerService.call),
          VicTile(titleText: "inbox.title".tr, to: AppRoutes.inbox),
          VicTile(titleText: "app.more".tr, to: AppRoutes.more),
        ],
      ),
    );
  }
}
