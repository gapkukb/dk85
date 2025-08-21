import 'package:app/shared/customer_service/customer_service.dart';
import 'package:app/shared/locale_selector/locale_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '/iconfont/index.dart';
import '/theme/index.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.background,
        image: DecorationImage(
          image: AssetImage("assets/images/auth-bg.webp"),
          alignment: Alignment.topCenter,
          fit: BoxFit.fitWidth,
        ),
      ),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: buildAppBar(),
          // body: CustomScrollView(
          //   slivers: [
          //     buildAppBar(),
          //     SliverList.list(
          //       children: [
          //         ...List.generate(100, (_) => ListTile(title: Text("data"))),
          //       ],
          //     ),
          //   ],
          // ),
          body: TabBarView(
            children: [
              ListView(
                children: [
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                ],
              ),
              SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  buildAppBar() {
    const tr = Radius.circular(16);
    return PreferredSize(
      preferredSize: Size.fromHeight(248),
      child: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        forceMaterialTransparency: true,
        titleSpacing: 8,
        title: const LocaleSelector(),
        actionsPadding: const EdgeInsets.only(right: 8),
        actions: [
          CustomerServiceTrigger(),
          const SizedBox(width: 8),
          buildButton(icon: IconFont.close, onTap: Get.back),
        ],
        automaticallyImplyLeading: false,
        flexibleSpace: FlexibleSpaceBar(background: buildLogo()),
        bottom: PreferredSize(
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
                Tab(text: "ဝင်ရောက်"),
                Tab(text: "မှတ်ပုံတင်"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildButton({required IconData icon, required VoidCallback onTap}) {
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
        child: Image.asset("assets/icons/logo-3.webp", width: 80, height: 80),
      ),
    );
  }
}
