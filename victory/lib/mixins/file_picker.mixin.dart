import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:victory/components/action_sheet/action_sheet.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

final class FilePicker {
  Future<List<String>> showPickerOptions() async {
    final value = await showVicActionSheet<int?, int?>(
      VicActionSheet.single(
        initValue: null,
        showIcon: false,
        actions: [
          const VicAction(title: 'File', value: 0),
          const VicAction(title: 'Camera', value: 1),
        ],
      ),
    );

    if (value == 0) return _file();
    if (value == 1) return _camare();
    return [];

    // BotToast.showAnimationWidget(
    //   clickClose: true,
    //   ignoreContentClick: false,
    //   animationDuration: Durations.medium3,
    //   backgroundColor: Colors.black54,
    //   backButtonBehavior: BackButtonBehavior.close,
    //   wrapToastAnimation: (controller, cancelFunc, widget) => SlideTransition(
    //     position: Tween<Offset>(
    //       begin: const Offset(0.0, 1.0),
    //       end: Offset.zero,
    //     ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut)),
    //     child: widget,
    //   ),
    //   toastBuilder: (cancelFunc) => Align(
    //     alignment: AlignmentGeometry.bottomCenter,
    //     child: Material(
    //       color: Colors.transparent,
    //       child: VicActionSheet.single(
    //         initValue: null,
    //         showIcon: false,
    //         actions: [
    //           VicAction(title: 'File', value: 0, onTap: _file),
    //           VicAction(title: 'Image', value: 1, onTap: _image),
    //           VicAction(title: 'Camare', value: 2, onTap: _camare),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }

  Future<List<String>> _file() async {
    await Future.delayed(Durations.long1);
    final status = await Permission.storage.status;
    if (status.isLimited || status.isPermanentlyDenied) {
      openAppSettings();
      return [];
    }
    if (status.isDenied) {
      final status = await Permission.storage.request();
      if (!status.isGranted) {
        openAppSettings();
        return [];
      }
    }

    final assets = await AssetPicker.pickAssets(
      Get.context!,
      pickerConfig: const AssetPickerConfig(),
    );

    if (assets == null) return [];
    final List<String> paths = [];
    for (var item in assets) {
      final f = await item.file;
      if (f != null) {
        paths.add(f.uri.toString());
      }
    }
    return paths;
  }

  Future<List<String>> _camare() async {
    await Future.delayed(Durations.long1);
    final status = await Permission.camera.status;
    if (status.isLimited || status.isPermanentlyDenied) {
      openAppSettings();
      return [];
    }
    if (status.isDenied) {
      final status = await Permission.camera.request();
      if (!status.isGranted) {
        openAppSettings();
        return [];
      }
    }

    final AssetEntity? entity = await CameraPicker.pickFromCamera(
      Get.context!,
      pickerConfig: const CameraPickerConfig(),
    );

    if (entity == null) return [];
    final file = await entity.file;
    if (file == null) return [];
    return [file.uri.toString()];
  }
}
