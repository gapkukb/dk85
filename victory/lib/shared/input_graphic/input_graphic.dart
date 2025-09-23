import 'dart:async';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../apis/apis.dart';
import '../../components/input_base/input_base.dart';
import '../../iconfont/iconfont.dart';
import '../../theme/theme.dart';

class VicGraphicInput extends StatefulWidget {
  final ValueChanged<String> onImageChange;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onFieldSubmitted;
  final Key? imageKey;

  const VicGraphicInput({super.key, this.onSaved, this.onFieldSubmitted, this.imageKey, required this.onImageChange});

  @override
  State<VicGraphicInput> createState() => _VicGraphicInputState();
}

class _VicGraphicInputState extends State<VicGraphicInput> {
  final logic = TextEditingController();
  @override
  Widget build(BuildContext context) {
    const maxLength = 4;
    return Stack(
      children: [
        VicBaseInput(
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
            borderRadius: const BorderRadius.horizontal(right: Radius.circular(8)),
            child: _CodeImage(
              key: widget.imageKey,
              onChanged: (value) {
                if (mounted) {
                  if (logic.text.isNotEmpty) {
                    logic.clear();
                  }
                  widget.onImageChange(value);
                }
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
    Apis.app
        .queryCaptcha(
          queryParameters: {'time': t},
          options: Options(responseType: ResponseType.bytes),
        )
        .then((value) {
          if (mounted) {
            image = Image.memory(value, fit: BoxFit.fill);
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

mixin class VicGraphicInputController {
  final imageKey = GlobalKey<CodeImageState>();
  void refreshImage() {
    imageKey.currentState?.queryImage();
  }
}
