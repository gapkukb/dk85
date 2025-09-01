import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../iconfont/index.dart';
import '../../theme/index.dart';
import '../input_base/input_base.dart';

class AKGraphicInput extends StatelessWidget {
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onFieldSubmitted;
  const AKGraphicInput({super.key, this.onSaved, this.onFieldSubmitted});

  @override
  Widget build(BuildContext context) {
    const maxLength = 4;
    return Stack(
      children: [
        AKBaseInput(
          placeholder: "form.graphic.placed".tr,
          prefixIconName: IconFont.tuxingma1,
          suffixIconName: IconFont.VIP2,
          suffixIconConstraints: BoxConstraints.loose(const Size(108, 48)),
          onSaved: onSaved,
          maxLength: maxLength,
          textInputAction: TextInputAction.done,
          onFieldSubmitted: onFieldSubmitted,
          validator: (value) {
            if (value == null || value.isEmpty) return "form.graphic.placed".tr;
            if (value.length != maxLength) return "form.graphic.error".tr;
            return null;
          },
        ),

        const Positioned(
          right: 0,
          top: 0,
          width: 100,
          height: 48,
          child: ClipRRect(
            borderRadius: BorderRadius.horizontal(right: Radius.circular(8)),
            child: _CodeImage(),
          ),
        ),
      ],
    );
  }
}

class _CodeImage extends StatefulWidget {
  const _CodeImage();

  @override
  _CodeImageState createState() => _CodeImageState();
}

class _CodeImageState extends State<_CodeImage> {
  final icon = const DecoratedBox(
    decoration: BoxDecoration(color: AppColors.loading),
    child: Icon(IconFont.yule, size: 36, color: AppColors.description),
  );
  bool loading = false;
  Image? image;

  @override
  Widget build(BuildContext context) {
    if (loading) return icon;
    return GestureDetector(onTap: queryImage, child: image ?? icon);
  }

  queryImage() {
    loading = true;
    setState(() {});
    Future.delayed(Durations.extralong1)
        .then((value) {
          return isImageValid(Uint8List(10));
        })
        .then((value) {
          image = Image.memory(value, fit: BoxFit.fill);
        })
        .whenComplete(() {
          loading = false;
          setState(() {});
        });
  }

  Future<Uint8List> isImageValid(List<int>? rawList) async {
    final error = Future<Uint8List>.error('Invalid Image Bytes');

    if (rawList == null) return error;
    final uInt8List = rawList is Uint8List
        ? rawList
        : Uint8List.fromList(rawList);

    try {
      final codec = await instantiateImageCodec(uInt8List, targetWidth: 1);
      final frameInfo = await codec.getNextFrame();
      if (frameInfo.image.width > 0) return uInt8List;
      return error;
    } catch (e) {
      return error;
    }
  }

  @override
  void dispose() {
    image = null;
    super.dispose();
  }
}
