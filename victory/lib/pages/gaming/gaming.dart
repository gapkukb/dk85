import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../apis/apis.dart';
import '../../models/models.dart';
import '../../routes/app_pages.dart';
import '../../shared/dialog/dialog.dart';
import '../../shared/webview/webview.dart';
import '../../stores/stores.dart';

class VicGamingPage extends StatefulWidget {
  static void playGame(Game game) async {
    play(game.platformId, game.code, game.platform);
  }

  static void play(num platformId, String gameCode, String platform) async {
    await stores.auth.ensureAuthorizedAsync;
    await VicDialog.confirm(title: 'game.enter.title'.tr);
    final resp = await Apis.game.queryGameUrl(data: {'game_id': platformId, 'key': gameCode, 'game_platform': platform, 'mobile': 1});
    final r = resp.data;
    if (!r.containsKey('url')) {
      throw 'Not found the game url';
    }
    Get.toNamed(AppRoutes.gaming, arguments: resp.data['url']);
  }

  const VicGamingPage({Key? key}) : super(key: key);

  @override
  _GamingState createState() => _GamingState();
}

class _GamingState extends State<VicGamingPage> {
  @override
  Widget build(BuildContext context) {
    return Webview(url: Get.arguments as String, backButton: true, pauseAudio: true);
  }
}
