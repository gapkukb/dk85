import 'package:app/iconfont/index.dart';
import 'package:app/theme/index.dart';
import 'package:app/widgets/back_button/back_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class FundsMngView extends GetView<FundsMngController> {
  const FundsMngView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FundsMngController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            leading: AKBackButton(),
            title: Text("withdraw.acc.title".tr),
          ),
          body: SafeArea(
            child: ListView(
              children: [
                CupertinoListSection.insetGrouped(
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  hasLeading: false,
                  header: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "withdraw.acc.add".tr,
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  children: [],
                ),
                SizedBox(height: 8),
                CupertinoListSection.insetGrouped(
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  hasLeading: false,
                  header: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "withdraw.acc.list".tr,
                        style: TextStyle(fontSize: 14),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          IconFont.refresh,
                          size: 16,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                  children: [],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
