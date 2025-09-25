import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:victory/theme/theme.dart';

final placeHolderImage = const Skeletonizer(
  effect: ShimmerEffect(
    begin: AlignmentDirectional(-2, -0.3),
    end: AlignmentDirectional(2, 0.3),
    baseColor: AppColors.skeleton,
    highlightColor: Color(0xffeeeeee),
  ),
  child: SizedBox(
    width: double.infinity,
    height: double.infinity,
    child: DecoratedBox(decoration: BoxDecoration(color: AppColors.title)),
  ),
);

Widget _placeholder(BuildContext context, url, [option]) {
  return placeHolderImage;
}

class VicNetworkImage extends CachedNetworkImage {
  VicNetworkImage({
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
