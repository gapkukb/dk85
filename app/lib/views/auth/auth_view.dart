import 'package:app/shared/customer_service/customer_service.dart';
import 'package:app/shared/locale_selector/locale_selector.dart';
import 'package:app/views/auth/controller.dart';
import 'package:app/views/auth/log_in_view.dart';
import 'package:app/views/auth/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '/iconfont/index.dart';
import '/theme/index.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: AuthCotroller(),
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
              body: TabBarView(children: [LoginView(), SignUpView()]),
            ),
          ),
        );
      },
    );
  }

  buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(248),
      child: AppBar(
        // systemOverlayStyle: const SystemUiOverlayStyle(
        //   statusBarColor: Colors.transparent,
        //   statusBarIconBrightness: Brightness.light,
        // ),
        forceMaterialTransparency: true,
        titleSpacing: 8,
        title: const LocaleSelector(
          size: 28,
          iconSize: 20,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(100))),
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
      child: ClipRRect(borderRadius: BorderRadius.circular(8), child: Image.asset("assets/icons/logo-3.webp", width: 80, height: 80)),
    );
  }

  List<Widget> buildActions() {
    return [CustomerService(size: 28, iconSize: 20), const SizedBox(width: 8), buildCloseButton(icon: IconFont.close, onTap: Get.back)];
  }

  PreferredSizeWidget? buildTabs() {
    const tr = Radius.circular(16);

    return PreferredSize(
      preferredSize: Size.fromHeight(56),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: tr, topRight: tr),
        ),
        child: TabBar(
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
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
