import 'dart:math';

import '/iconfont/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

final placeHolderImage = Container(
  width: double.infinity,
  height: double.infinity,
  color: Colors.black12,
  child: LayoutBuilder(
    builder: (context, constraints) {
      var small = min(constraints.maxHeight, constraints.maxWidth);

      return Icon(IconFont.yule, color: Colors.black.withAlpha(15), size: small / 1.5);
    },
  ),
);

Widget _placeholder(BuildContext context, url, [option]) {
  return placeHolderImage;
}

class NetworkPicture extends CachedNetworkImage {
  NetworkPicture({
    super.key,
    required super.imageUrl,
    super.width,
    super.height,
    super.fit = BoxFit.cover,
    super.alignment,
    super.cacheKey,
    super.cacheManager,
    super.color,
    super.colorBlendMode,
    super.errorListener,
    super.imageBuilder,
    super.memCacheWidth,
    super.memCacheHeight,
    super.maxWidthDiskCache,
    super.maxHeightDiskCache,
    super.scale,
  }) : super(placeholder: _placeholder, errorWidget: _placeholder);
}
