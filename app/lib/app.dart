import 'package:app/theme/index.dart';
import 'package:app/theme/light.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:scaled_app/scaled_app.dart';
import 'package:app/router/index.dart';

class App extends StatelessWidget {
  const App() : super(key: const Key("app"));

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).scale(),
      child: RefreshConfiguration(
        headerBuilder: () => WaterDropMaterialHeader(
          backgroundColor: AppColor.main,
          distance: 36,
        ), // 配置默认头部指示器,假如你每个页面的头部指示器都一样的话,你需要设置这个
        footerBuilder: () => ClassicFooter(), // 配置默认底部指示器
        // headerTriggerDistance: 80.0, // 头部触发刷新的越界距离
        enableLoadingWhenFailed: true, //在加载失败的状态下,用户仍然可以通过手势上拉来触发加载更多
        hideFooterWhenNotFull: true, // Viewport不满一屏时,禁用上拉加载更多功能
        enableBallisticLoad: true, // 可以通过惯性滑动触发加载更多

        child: GetMaterialApp(
          color: Colors.white,
          // debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: lightTheme,
          themeMode: ThemeMode.light,
          title: 'DK85',
          binds: [],
          getPages: AppPages.routes,
          initialRoute: AppPages.initial,
        ),
      ),
    );
  }
}
