import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:victory/apis/apis.dart';
import 'package:victory/models/models.dart';
import 'package:victory/routes/app_pages.dart';
import 'package:victory/shared/dialogs/dialog.dart';
import 'package:victory/shared/webview/webview.dart';
import 'package:victory/services/services.dart';

class VicGamingPage extends StatefulWidget {
  static void playGame(VicGameModel game) async {
    play(game.platformId, game.code, game.platform);
  }

  static void play(num platformId, String gameCode, String platform) async {
    if (!services.auth.ensureAuthorized) return;
    await VicDialog.confirm(title: 'game.enter.title'.tr);
    final resp = await apis.game.queryGameUrl(data: {'game_id': platformId, 'key': gameCode, 'game_platform': platform, 'mobile': 1});
    final r = resp.data;
    if (!r.containsKey('url')) {
      throw 'Not found the game url';
    }
    Get.toNamed(AppRoutes.gaming, arguments: resp.data['url']);
  }

  const VicGamingPage({super.key});

  @override
  _GamingState createState() => _GamingState();
}

class _GamingState extends State<VicGamingPage> {
  @override
  Widget build(BuildContext context) {
    return VicWebview(url: Get.arguments as String, backButton: true, pauseAudio: true);
  }
}
