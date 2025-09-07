import 'package:app/apis/apis.dart';
import 'package:app/models/game.model.dart';
import 'package:app/routes/app_pages.dart';
import 'package:app/services/index.dart';
import 'package:app/shared/confirmation/confirmation.dart';
import 'package:app/shared/webview/webview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GamingView extends StatelessWidget {
  static void play(GameModel game) async {
    await services.auth.ensureAuthorizedAsync;
    await Get.confirm(title: 'You will enter the Game');
    final resp = await apis.game.queryGameUrl(queryParameters: {'game_id': 17, 'key': game.code, 'game_platform': game.platform, 'mobile': 1});
    final r = resp.data;
    if (!r.containsKey('url')) {
      throw '未找到url地址';
    }
    Get.toNamed(Routes.gaming, parameters: r.cast());
  }

  const GamingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Webview(url: Get.parameters['url']!);
  }
}
