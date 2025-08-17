import 'package:contentsize_tabbarview/contentsize_tabbarview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../iconfont/index.dart';
import '../../theme/index.dart';
import '../../ui/locale_picker/locale_picker.dart';
import '../../widgets/keep_alive_wrapper.dart';
import '../../widgets/service_calling.dart';
import '../login/index.dart';
import '../register/index.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: AppColors.background,
          image: DecorationImage(image: AssetImage("assets/images/sign_in_up_bg.webp"), alignment: Alignment.topCenter, fit: BoxFit.fitWidth),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          // appBar: buildAppBar(),
          body: CustomScrollView(
            slivers: [
              buildAppBar(),
              const SliverToBoxAdapter(
                child: ContentSizeTabBarView(
                  children: [
                    KeepAliveWrapper(child: LoginView()),
                    KeepAliveWrapper(child: RegisterView()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildAppBar() {
    return SliverAppBar(
      forceMaterialTransparency: true,
      titleSpacing: 12,
      title: const AKLocalePicker(),
      actionsPadding: const EdgeInsets.only(right: 12),
      actions: [
        buildButton(icon: IconFont.kefu, onTap: callService),
        const SizedBox(width: 8),
        buildButton(icon: IconFont.close, onTap: Get.back),
      ],
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(background: UnconstrainedBox(child: buildLogo())),
      collapsedHeight: 180,
      bottom: const TabBar(
        dividerColor: Colors.transparent,
        // tabAlignment: TabAlignment.center,
        padding: EdgeInsets.symmetric(horizontal: 64),
        tabs: [
          Tab(text: "ဝင်ရောက်"),
          Tab(text: "မှတ်ပုံတင်"),
        ],
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
    return Image.asset("assets/images/logo.webp", width: 72, height: 72);
  }

  buildView() {
    return const TabBarView(children: [LoginView(), RegisterView()]);
  }
}
