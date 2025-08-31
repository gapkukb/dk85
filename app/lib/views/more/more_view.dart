import 'package:app/i18n/index.dart';
import 'package:app/services/index.dart';
import 'package:app/shared/confirmation/confirmation.dart';
import 'package:app/shared/locale_selector/locale_selector.dart';
import 'package:app/shared/package_info/index.dart';
import 'package:app/storage/storage.dart';
import 'package:app/theme/index.dart';
import 'package:app/widgets/back_button/back_button.dart';
import 'package:app/widgets/button/index.dart';
import 'package:app/widgets/tile/tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoreView extends StatefulWidget {
  const MoreView({super.key});

  @override
  _MoreViewState createState() => _MoreViewState();
}

class _MoreViewState extends State<MoreView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: AKBackButton(), title: Text("page.more".tr)),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12),
        children: [
          CupertinoListSection.insetGrouped(
            additionalDividerMargin: 0,
            margin: EdgeInsets.all(0),
            children: [
              AKTile(
                titleText: 'app.language'.tr,
                trailing: Obx(
                  () => Text(I18n.getLocaleName(storage.locale.value)),
                ),
                onTap: LocaleSelector.showPicker,
              ),
              AKTile(
                titleText: 'app.version'.tr,
                trailing: Text(packageInfo.info.version),
                isLink: false,
              ),
              AKTile(
                titleText: 'app.bgm'.tr,
                trailing: Transform.scale(
                  alignment: Alignment(2, 0),
                  scale: 0.85,
                  child: Obx(
                    () => CupertinoSwitch(
                      value: storage.music.value,
                      onChanged: (value) {
                        storage.music.update(value);
                      },
                    ),
                  ),
                ),
                isLink: false,
                onTap: LocaleSelector.showPicker,
              ),
            ],
          ),

          SizedBox(height: 24),

          AKButton(
            onPressed: () async {
              final guaranteed = await Get.confirm(
                content: 'logout.title'.tr,
                confirmStyle: TextStyle(color: AppColors.highlight),
              );
              if (guaranteed == true) {
                AuthService.to.logout();
              }
            },
            text: 'app.logout'.tr,
          ),
        ],
      ),
    );
  }
}
