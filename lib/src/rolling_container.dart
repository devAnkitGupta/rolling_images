import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final int idx;
  final double currentPage;
  final String url;
  final BoxFit fit;
  final EdgeInsets margin;
  final double borderRadius;
  final bool isLocalImage;
  final BoxShape boxShape;

  const ImageCard({
    Key? key,
    required this.idx,
    required this.currentPage,
    required this.url,
    required this.fit,
    required this.margin,
    required this.borderRadius,
    required this.isLocalImage,
    required this.boxShape,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double relativePosition = idx - currentPage;
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.002)
        ..scale((1 - relativePosition.abs()).clamp(0.2, 0.6) + 0.4)
        ..rotateZ(relativePosition),
      alignment:
          relativePosition >= 0 ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: boxShape == BoxShape.circle
              ? null
              : BorderRadius.circular(borderRadius),
          image: isLocalImage
              ? DecorationImage(image: AssetImage(url), fit: fit)
              : DecorationImage(
                  image: CachedNetworkImageProvider(url, cacheKey: url),
                  fit: fit,
                ),
          shape: boxShape,
        ),
      ),
    );
  }
}
