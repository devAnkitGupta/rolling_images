import 'package:flutter/material.dart';
import './rolling_container.dart';

/// Rolling Cards
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

  /// List of urls (local/network) which need to be displayed
  final List<String> imageUrls;

  /// flage by which widget identifies wheather the image are local
  /// assets or needed to be fetched from users
  final bool isLocalAsset;

  /// The fraction of the viewport that each page should occupy.
  /// Defaults to 1.0, which means each image page fills the viewport in the scrolling direction.
  final double viewportFraction;

  /// BorderRadius for image default value is 20
  /// provide 0 for no border radius
  final double? borderRadius;

  /// The shape to use when rendering a image.
  /// Default value is Rectangle
  final BoxShape? imageContainerShape;

  /// How a box should be inscribed into another box.
  final BoxFit? fit;

  /// Margins provided for image
  ///  Default is
  ///
  /// ``` dart
  /// const EdgeInsets.only(
  /// top: 20,
  /// bottom: 20,
  /// left: 15,
  /// right: 15,
  /// )
  /// ```
  final EdgeInsets? margin;

  /// Callback returning current image display value
  /// initial image value when build is 0
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

  /// Convert List of urls to Map<int, String>
  /// to produce keys with index of itself in list
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
    _controller.addListener(
      () {
        Future.microtask(
          () => setState(
            () {
              currentPage = _controller.page!;
            },
          ),
        );
      },
    );
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
