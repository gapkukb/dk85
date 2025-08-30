import 'dart:async';
import 'dart:ui';

import 'package:app/apis/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../iconfont/index.dart';
import '../../theme/index.dart';
import '../input_base/input_base.dart';

class AKGraphicInput extends StatefulWidget {
  final ValueChanged<String> onImageChange;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onFieldSubmitted;
  final Key? imageKey;

  const AKGraphicInput({
    super.key,
    this.onSaved,
    this.onFieldSubmitted,
    this.imageKey,
    required this.onImageChange,
  });

  @override
  State<AKGraphicInput> createState() => _AKGraphicInputState();
}

class _AKGraphicInputState extends State<AKGraphicInput> {
  final logic = TextEditingController();
  @override
  Widget build(BuildContext context) {
    const maxLength = 4;
    return Stack(
      children: [
        AKBaseInput(
          controller: logic,
          placeholder: "form.graphic.placed".tr,
          prefixIconName: IconFont.tuxingma1,
          suffixIconName: IconFont.VIP2,
          suffixIconConstraints: BoxConstraints.loose(const Size(108, 48)),
          onSaved: widget.onSaved,
          maxLength: maxLength,
          textInputAction: TextInputAction.done,
          onFieldSubmitted: widget.onFieldSubmitted,
          validator: (value) {
            if (value == null || value.isEmpty) return "form.graphic.placed".tr;
            if (value.length != maxLength) return "form.graphic.error".tr;
            return null;
          },
        ),

        Positioned(
          right: 0,
          top: 0,
          width: 100,
          height: 48,
          child: ClipRRect(
            borderRadius: const BorderRadius.horizontal(
              right: Radius.circular(8),
            ),
            child: _CodeImage(
              key: widget.imageKey,
              onChanged: (value) {
                logic.clear();
                widget.onImageChange(value);
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _CodeImage extends StatefulWidget {
  final ValueChanged<String> onChanged;
  const _CodeImage({super.key, required this.onChanged});

  @override
  CodeImageState createState() => CodeImageState();
}

class CodeImageState extends State<_CodeImage> {
  final icon = const DecoratedBox(
    decoration: BoxDecoration(color: AppColors.loading),
    child: Icon(IconFont.yule, size: 36, color: AppColors.description),
  );
  bool loading = false;
  Image? image;

  @override
  void initState() {
    queryImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (loading) return icon;
    return GestureDetector(onTap: queryImage, child: image ?? icon);
  }

  queryImage() {
    loading = true;
    setState(() {});
    final t = DateTime.now().millisecondsSinceEpoch;
    widget.onChanged(t.toString());
    queryCaptcha(payload: {'time': t})
        .then((value) {
          if (mounted) {
            image = Image.memory(Uint8List.fromList(value), fit: BoxFit.fill);
          }
        })
        .whenComplete(() {
          if (mounted) {
            loading = false;
            setState(() {});
          }
        });
  }
}

mixin class AKGraphicInputController {
  final imageKey = GlobalKey<CodeImageState>();
  void refreshImage() {
    imageKey.currentState?.queryImage();
  }
}
