import 'package:flutter/material.dart';
import './rolling_container.dart';

class RollingCards extends StatefulWidget {
  const RollingCards({
    Key? key,
    required this.imageUrls,
    required this.isLocalAsset,
    this.viewportFraction = 0.96,
    this.borderRadius,
    this.imageContainerShape,
    this.fit,
    this.margin,
    this.onPageChanged,
  }) : super(key: key);

  final List<String> imageUrls;
  final bool isLocalAsset;
  final double viewportFraction;
  final double? borderRadius;
  final BoxShape? imageContainerShape;
  final BoxFit? fit;
  final EdgeInsets? margin;
  final Function(int)? onPageChanged;

  @override
  _RollingCardsState createState() => _RollingCardsState();
}

class _RollingCardsState extends State<RollingCards> {
  late PageController _controller;
  double currentPage = 0.0;
  Duration animateTime = const Duration(milliseconds: 700);
  Curve curve = Curves.ease;
  bool isAnimating = false;
  late Map<int, String> indexedMapUrl;

  @override
  void initState() {
    _controller = PageController(
      viewportFraction: widget.viewportFraction,
      keepPage: true,
    );
    indexedMapUrl = widget.imageUrls.asMap();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _controller.addListener(() {
      Future.microtask(() => setState(() {
            currentPage = _controller.page!;
          }));
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      children: indexedMapUrl.entries
          .map(
            (e) => ImageCard(
              idx: e.key,
              currentPage: currentPage,
              key: Key('${e.key} ${e.value}'),
              url: e.value,
              isLocalImage: widget.isLocalAsset,
              borderRadius: widget.borderRadius ?? 20,
              boxShape: widget.imageContainerShape ?? BoxShape.rectangle,
              fit: widget.fit ?? BoxFit.cover,
              margin: widget.margin ??
                  const EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                    left: 15,
                    right: 15,
                  ),
            ),
          )
          .toList(),
      onPageChanged: (value) {
        if (widget.onPageChanged != null) {
          widget.onPageChanged!(value);
        }
      },
    );
  }
}
