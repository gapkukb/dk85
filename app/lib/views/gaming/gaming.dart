import 'package:app/apis/index.dart';
import 'package:app/models/game.model.dart';
import 'package:app/routes/app_pages.dart';
import 'package:app/services/index.dart';
import 'package:app/shared/confirmation/confirmation.dart';
import 'package:app/shared/webview/webview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GamingView extends StatelessWidget {
  static void play(Game game) async {
    await AuthService.to.ensureAuthorizedAsync;
    await Get.confirm(title: 'You will enter the Game');
    final Map<String, dynamic> r = await queryGameUrl(
      payload: {
        'game_id': 17,
        'key': game.code,
        'game_platform': game.platform,
        'mobile': 1,
      },
    );
    Get.toNamed(Routes.gaming, parameters: r.cast());
  }

  const GamingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Webview(url: Get.parameters['url'] ?? '未找到url地址');
  }
}
