import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../iconfont/index.dart';
import '../../services/index.dart';
import '../../theme/index.dart';
import '../../ui/gutter/index.dart';

class AnnouncementView extends StatelessWidget {
  const AnnouncementView({super.key});
  static const border = Border(bottom: BorderSide(color: Color(0xfff1f1f1)));

  @override
  Widget build(BuildContext context) {
    final appService = Get.put<AppService>(AppService());

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      backgroundColor: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.red,
              image: const DecorationImage(image: AssetImage("assets/images/bulletin-bg.webp"), fit: BoxFit.fitWidth, alignment: Alignment.topCenter),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "公告",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white, height: 2.5),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                  child: Material(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(8),
                    clipBehavior: Clip.antiAlias,
                    child: Theme(
                      data: Theme.of(context).copyWith(dividerColor: const Color(0xfff1f1f1)),
                      child: Container(
                        color: Colors.white,
                        height: Get.height / 2,
                        child: SingleChildScrollView(
                          child: Column(mainAxisSize: MainAxisSize.min, children: [buildItem(), buildItem(), buildItem()]),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Gutter.normal,
          IconButton.filled(
            color: AppColors.danger,
            style: IconButton.styleFrom(backgroundColor: Colors.white),
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Symbols.close),
          ),
        ],
      ),
    );
  }

  buildItem() {
    return const ExpansionTile(
      shape: border,
      collapsedShape: border,
      title: Text('Question 1: What is Flutter?'),
      collapsedTextColor: AppColors.primary,
      textColor: AppColors.primary,
      iconColor: AppColors.primary,
      collapsedIconColor: AppColors.primary,
      children: <Widget>[
        Divider(color: Color(0xfff1f1f1), thickness: 0, height: 1),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Text('Flutter is a UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.'),
        ),
      ],
    );
  }
}
