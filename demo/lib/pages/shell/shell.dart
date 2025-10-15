import 'dart:developer';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/utils.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class Shell extends StatefulWidget {
  const Shell({Key? key}) : super(key: key);

  @override
  _ShellState createState() => _ShellState();
}

class _ShellState extends State<Shell> {
  final editorKey = GlobalKey();
  final ImageEditorController _editorController = ImageEditorController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('xxxxxxxxxxxxxxxxxxxxxxxxx');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: capture),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Text('data');
          },
        ),
      ),
    );
  }

  openAlbum() async {
    final List<AssetEntity>? result = await AssetPicker.pickAssets(
      context,
      pickerConfig: const AssetPickerConfig(
        maxAssets: 1,
        requestType: RequestType.image,
        specialPickerType: SpecialPickerType.noPreview,
      ),
    );

    if (result?.isEmpty == true) return;

    final file = await result!.first.file;
    inspect(file);

    if (file == null) return;
    await Get.toNamed('/avatar_image', arguments: file);
  }

  capture() async {
    final result = await CameraPicker.pickFromCamera(
      context,
      pickerConfig: const CameraPickerConfig(
        textDelegate: EnglishCameraPickerTextDelegate(),
      ),
    );
    if (result == null) return;
    final file = await result.file;
    if (file == null) return;
    await Get.toNamed('/avatar_image', arguments: file);
  }
}
