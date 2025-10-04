import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:victory/helper/native_image.dart';
import 'package:victory/iconfont/iconfont.dart';
import 'package:victory/shared/locale/locale.dart';
import 'package:victory/pages/customer_service/customer_service.dart';
import 'package:victory/pages/auth/controller.dart';
import 'package:victory/theme/theme.dart';
import 'package:victory/pages/auth/log_in_view.dart';
import 'package:victory/pages/auth/sign_up_view.dart';

class VicAuthPage extends StatelessWidget {
  const VicAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: VicAuthCotroller(),
      builder: (context) {
        return DecoratedBox(
          decoration: const BoxDecoration(
            color: AppColors.background,
            image: DecorationImage(image: AssetImage("assets/images/auth-bg.webp"), alignment: Alignment.topCenter, fit: BoxFit.fitWidth),
          ),
          child: DefaultTabController(
            length: 2,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: buildAppBar(),
              body: const TabBarView(children: [VicLoginView(), VicSignUpView()]),
            ),
          ),
        );
      },
    );
  }

  buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(248),
      child: AppBar(
        forceMaterialTransparency: true,
        elevation: 0,
        titleSpacing: 8,
        title: const LocalePicker(
          size: 28,
          iconSize: 20,
        ),
        actionsPadding: const EdgeInsets.only(right: 8),
        actions: buildActions(),
        automaticallyImplyLeading: false,
        flexibleSpace: FlexibleSpaceBar(background: buildLogo()),
        bottom: buildTabs(),
      ),
    );
  }

  buildCloseButton({required IconData icon, required VoidCallback onTap}) {
    return SizedBox.square(
      dimension: 28,
      child: IconButton(
        iconSize: 20,
        padding: const EdgeInsets.all(0),
        onPressed: onTap,
        color: Colors.white,
        style: IconButton.styleFrom(backgroundColor: Colors.white),
        icon: Icon(icon, color: AppColors.primary),
      ),
    );
  }

  buildLogo() {
    return UnconstrainedBox(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.file(
          File(NativeImage.logoLight),
          width: 80,
          height: 80,
        ),
      ),
    );
  }

  List<Widget> buildActions() {
    return [
      const VicCustomerService(size: 28, iconSize: 20),
      const SizedBox(width: 8),
      buildCloseButton(icon: IconFont.close, onTap: Get.back),
    ];
  }

  PreferredSizeWidget? buildTabs() {
    const tr = Radius.circular(16);

    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: tr, topRight: tr),
        ),
        child: TabBar(
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
          dividerColor: Colors.transparent,
          indicatorColor: Colors.transparent,
          // padding: EdgeInsets.symmetric(horizontal: 64),
          tabs: [
            Tab(text: "app.login".tr),
            Tab(text: "app.register".tr),
          ],
        ),
      ),
    );
  }
}
