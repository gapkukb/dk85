import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/back_button/back_button.dart';
import '../../components/button/button.dart';
import '../../components/tile/tile.dart';
import '../../shared/app_info/app_info.dart';
import '../../shared/dialog/dialog.dart';
import '../../shared/locale/locale.dart';
import '../../storage/storage.dart';
import '../../stores/stores.dart';
import '../../theme/theme.dart';

class VicMorePage extends StatefulWidget {
  const VicMorePage({super.key});

  @override
  _VicMorePageState createState() => _VicMorePageState();
}

class _VicMorePageState extends State<VicMorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const VicBackButton(), title: Text("more.title".tr)),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        children: [
          CupertinoListSection.insetGrouped(
            additionalDividerMargin: 0,
            margin: const EdgeInsets.all(0),
            children: [
              LocalePicker(
                child: VicTile(titleText: 'app.language'.tr, trailing: Obx(() => Text(stores.app.currentLocaleName))),
              ),

              VicTile(titleText: 'app.version'.tr, trailing: Text(VicAppInfo.shared.buildNumber), isLink: false),
              VicTile(
                titleText: 'app.bgm'.tr,
                trailing: Transform.scale(
                  alignment: const Alignment(2, 0),
                  scale: 0.85,
                  child: Obx(
                    () => CupertinoSwitch(
                      value: storage.audio.value,
                      onChanged: (value) {
                        storage.audio.update(value);
                        value ? stores.app.activeAudio() : stores.app.deactiveAudio();
                      },
                    ),
                  ),
                ),
                isLink: false,
                // onTap: LocaleSelector.showPicker,
              ),
            ],
          ),

          const SizedBox(height: 24),

          VicButton(
            // height: VicButtonHeight.medium,
            backgroundColor: AppColors.highlight,
            onPressed: () {
              VicDialog.confirm(title: 'logout.title'.tr, onConfirm: stores.auth.logout);
            },
            text: 'app.logout'.tr,
          ),
        ],
      ),
    );
  }
}
