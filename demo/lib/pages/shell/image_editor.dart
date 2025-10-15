import 'dart:io';
import 'dart:ui';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as image;

class ImageEditor2 extends StatefulWidget {
  const ImageEditor2({Key? key}) : super(key: key);

  @override
  _ImageEditorState createState() => _ImageEditorState();
}

class _ImageEditorState extends State<ImageEditor2> {
  var _cropping = false;
  final editorKey = GlobalKey<ExtendedImageEditorState>();
  final ImageEditorController _editorController = ImageEditorController();

  @override
  dispose() {
    super.dispose();
    _editorController.dispose();
  }

  Future<void> _cropImage() async {
    if (_cropping) {
      return;
    }
    try {
      final Uint8List img = _editorController.state!.rawImageData;
      Rect cropRect = _editorController.getCropRect()!;
      image.Image? src = await compute(image.decodeImage, img);

      var cropped = image.copyCropCircle(
        src!,
        centerX: cropRect.center.dx.toInt(),
        centerY: cropRect.center.dy.toInt(),
        radius: (cropRect.width / 2).toInt(),
        antialias: true,
        // x: cropRect.left.toInt(),
        // y: cropRect.top.toInt(),
        // width: cropRect.width.toInt(),
        // height: cropRect.height.toInt(),
      );

      var a = Uint8List.fromList(image.encodePng(cropped));

      Get.dialog(
        Container(
          color: Colors.black54,
          padding: const EdgeInsets.all(10.0),
          child: Image.memory(a, fit: BoxFit.contain),
        ),
      );
    } catch (e, stack) {}

    //Navigator.of(context).pop();

    _cropping = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExtendedImage.file(
        Get.arguments as File,
        fit: BoxFit.contain,
        mode: ExtendedImageMode.editor,
        extendedImageEditorKey: editorKey,
        cacheRawData: true,
        initEditorConfigHandler: (state) {
          return EditorConfig(
            maxScale: 8.0,
            cropRectPadding: EdgeInsets.all(20.0),
            hitTestSize: 20.0,
            cropAspectRatio: CropAspectRatios.ratio1_1,
            cropLayerPainter: CircleEditorCropLayerPainter(),
            editorMaskColorHandler: (context, pointerDown) => Colors.black87,
            controller: _editorController,
          );
        },
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        color: Color(0xff2c2931),
        padding: EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: Get.back,
              child: Text('Cancel', style: TextStyle(color: Colors.white)),
            ),
            GestureDetector(
              child: Container(
                width: 102,
                height: 36,
                alignment: Alignment(0, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  gradient: LinearGradient(
                    colors: [Color(0xfffdb756), Color(0xfff78336)],
                  ),
                ),
                child: Text(
                  'Confirm',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _cropImage,
        heroTag: 'crop',
      ),
    );
  }
}

class CircleEditorCropLayerPainter extends EditorCropLayerPainter {
  const CircleEditorCropLayerPainter();

  @override
  void paintCorners(
    Canvas canvas,
    Size size,
    ExtendedImageCropLayerPainter painter,
  ) {
    // do nothing
  }

  @override
  void paintMask(
    Canvas canvas,
    Rect rect,
    ExtendedImageCropLayerPainter painter,
  ) {
    final Rect cropRect = painter.cropRect;
    final Color maskColor = painter.maskColor;
    canvas.saveLayer(rect, Paint());
    canvas.drawRect(
      rect,
      Paint()
        ..style = PaintingStyle.fill
        ..color = maskColor,
    );
    canvas.drawCircle(
      cropRect.center,
      cropRect.width / 2.0,
      Paint()..blendMode = BlendMode.clear,
    );
    canvas.restore();
  }

  @override
  void paintLines(
    Canvas canvas,
    Size size,
    ExtendedImageCropLayerPainter painter,
  ) {
    final Rect cropRect = painter.cropRect;
    if (painter.pointerDown) {
      canvas.save();
      canvas.clipPath(Path()..addOval(cropRect));
      super.paintLines(canvas, size, painter);
      canvas.restore();
    }
  }
}
