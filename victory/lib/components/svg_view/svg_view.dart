import 'package:flutter/material.dart';
import 'package:vector_graphics/vector_graphics.dart';

class SvgView extends StatelessWidget {
  final String name;
  final double size;

  const SvgView({super.key, required this.name, this.size = 24.0});
  @override
  Widget build(BuildContext context) {
    return VectorGraphic(loader: AssetBytesLoader("assets/svg/$name"), width: size, height: size);
  }
}
