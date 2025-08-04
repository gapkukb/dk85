import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/index.dart';
import '../../theme/index.dart';

class AnnouncementView extends StatelessWidget {
  const AnnouncementView({super.key});
  static const border = Border(bottom: BorderSide(color: Color(0xfff1f1f1)));

  @override
  Widget build(BuildContext context) {
    final appService = Get.put<AppService>(AppService());

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("公告"),
        titleTextStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        centerTitle: true,
        shape: LinearBorder.none,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: 56, left: 16, right: 16, bottom: 16),
        decoration: const BoxDecoration(
          color: Color(0Xfffed5cc),
          image: DecorationImage(image: AssetImage("assets/images/bulletin-bg.webp"), fit: BoxFit.fitWidth, alignment: Alignment.topCenter),
        ),
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          clipBehavior: Clip.antiAlias,
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: const Color(0xfff1f1f1)),
            child: ListView(padding: const EdgeInsets.all(0), children: [buildItem(), buildItem(), buildItem()]),
          ),
        ),
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
