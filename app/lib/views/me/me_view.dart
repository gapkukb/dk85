import 'package:app/routes/app_pages.dart';
import 'package:app/services/index.dart';
import 'package:app/shared/customer_service/customer_service.dart';
import 'package:app/widgets/button/index.dart';
import 'package:app/widgets/tile/tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/shared/account_balance/account_balance.dart';
import 'package:app/theme/index.dart';
import 'package:app/views/promos/promos_controller.dart';
import 'package:get/get.dart';

class MeView extends StatefulWidget {
  const MeView({super.key});

  @override
  _MeViewState createState() => _MeViewState();
}

class _MeViewState extends State<MeView> {
  @override
  Widget build(BuildContext context) {
    return _MeView();
  }
}

class _MeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: PromosController(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: ListView(
              children: [
                SizedBox(height: 0),
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
      alignment: Alignment(-1, 2),
      child: Row(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CircleAvatar(radius: 30, backgroundImage: AssetImage("assets/icons/logo-3.webp")),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(color: Color(0xfffffac4), borderRadius: BorderRadius.circular(100)),
            child: Text(
              'VIP1',
              style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic, color: AppColors.primary, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: AccountBalance(
            height: 200,
            before: SizedBox(height: 30),
            after: Row(
              spacing: 16,
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: AKButton(
                    onPressed: () {
                      services.app.toFundsView(0);
                    },
                    text: 'app.withdraw'.tr,
                    color: AppColors.white,
                    textColor: AppColors.primary,
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: AKButton(
                    onPressed: () {
                      services.app.toFundsView(1);
                    },
                    text: 'app.withdraw'.tr,
                    color: Colors.white,
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
      data: ListTileThemeData(
        minTileHeight: 56,
        iconColor: AppColors.primary,
        titleTextStyle: TextStyle(
          fontSize: 14,
          color: AppColors.title,
          // fontWeight: FontWeight.bold,
        ),
      ),

      child: CupertinoListSection.insetGrouped(
        margin: EdgeInsets.all(12),
        additionalDividerMargin: 0,
        children: [
          AKTile(titleText: "page.account".tr, to: Routes.profile),
          AKTile(titleText: "rebate.title".tr, to: Routes.rebate),
          AKTile(
            titleText: "page.vip".tr,
            titleTextStyle: TextStyle(color: AppColors.primary),
            to: Routes.vip,
          ),
          AKTile(titleText: "page.favorites".tr, to: Routes.favorites),
          // AKTile(titleText: "page.invitation".tr, to: Routes.invitation),
          AKTile(titleText: "page.service".tr, onTap: CustomerService.call),
          AKTile(titleText: "page.inbox".tr, to: Routes.inbox),
          AKTile(titleText: "page.more".tr, to: Routes.more),
        ],
      ),
    );
  }
}
