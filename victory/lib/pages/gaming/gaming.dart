import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:victory/apis/apis.dart';
import 'package:victory/helper/system_ui.dart';
import 'package:victory/mixins/webview.mixin.dart';
import 'package:victory/models/models.dart';
import 'package:victory/routes/app_pages.dart';
import 'package:victory/shared/dialogs/dialog.dart';
import 'package:victory/services/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VicGamingPage extends StatefulWidget {
  static void playGame(VicGameModel game) async {
    play(game.platformId, game.code, game.platform);
  }

  static void play(num platformId, String gameCode, String platform) async {
    if (!services.auth.ensureAuthorized) return;
    await VicDialog.confirm(content: 'game.enter.title'.tr);
    final resp = await apis.game.queryGameUrl(data: {'game_id': platformId, 'key': gameCode, 'game_platform': platform, 'mobile': 1});
    if (!resp.containsKey('url')) {
      throw 'Not found the game url';
    }
    await Get.toNamed(AppRoutes.gaming, arguments: resp['url']);
    services.user.queryUserInfo();
  }

  const VicGamingPage({super.key});

  @override
  _GamingState createState() => _GamingState();
}

class _GamingState extends State<VicGamingPage> with WebviewMixin {
  @override
  void initState() {
    webview.loadRequest(Get.arguments as String);
    SystemUIHelper.unlockOrientation();
    SystemUIHelper.immersiveSticky();
    services.app.pauseAudio();
    super.initState();
  }

  @override
  void dispose() {
    webview.reset();
    services.app.resumeAudio();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        ask();
      },
      child: Scaffold(
        body: Stack(
          children: [
            WebViewWidget(
              controller: webview.controller,
            ),
            webview.backButton(message: 'app.exit.game'.tr, borderTop: 24, borderLeft: 12, onBack: ask),
          ],
        ),
      ),
    );
  }

  ask() {
    webview.askExit(
      message: 'app.exit.game'.tr,
      onConfirm: () {
        SystemUIHelper.restore();
      },
    );
  }
}
