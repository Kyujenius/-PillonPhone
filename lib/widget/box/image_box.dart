import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pill_on_phone/config/color_system.dart';
import 'package:shimmer/shimmer.dart';

class ImageBox extends StatelessWidget {
  const ImageBox({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
    this.borderRadius = BorderRadius.zero,
    this.backgroundColor = ColorSystem.neutral,
  });

  final String imageUrl;
  final double width;
  final double height;
  final BorderRadius borderRadius;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Container(
        width: width,
        height: height,
        color: backgroundColor,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: ColorSystem.neutral.shade100,
            highlightColor: ColorSystem.white,
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                color: ColorSystem.neutral.shade100,
              ),
            ),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
