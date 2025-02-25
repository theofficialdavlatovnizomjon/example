import 'package:flutter/material.dart';

class MyCachedNetworkImage extends StatefulWidget {
  final String imageUrl;
  final AlignmentGeometry alignment;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final FilterQuality filterQuality;
  final ImageRepeat repeat;
  final String? semanticLabel;
  final double scale;
  final PlaceholderWidgetBuilder? placeholder;
  final ErrorWidgetBuilder? errorWidgetBuilder;
  final Duration fadeDuration;
  final Curve curve;

  const MyCachedNetworkImage({
    required this.imageUrl,
    this.alignment = Alignment.center,
    this.filterQuality = FilterQuality.low,
    this.repeat = ImageRepeat.noRepeat,
    this.scale = 1,
    this.fadeDuration = const Duration(milliseconds: 1000),
    this.curve = Curves.easeInCirc,
    this.fit,
    this.width,
    this.height,
    this.semanticLabel,
    this.placeholder,
    this.errorWidgetBuilder,
    super.key,
  });

  @override
  State<MyCachedNetworkImage> createState() => _MyCachedNetworkImageState();
}

class _MyCachedNetworkImageState extends State<MyCachedNetworkImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: widget.fadeDuration);
    _animation = CurvedAnimation(parent: _controller, curve: widget.curve);
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Image.network(
        widget.imageUrl,
        alignment: widget.alignment,
        fit: widget.fit,
        width: widget.width,
        height: widget.height,
        filterQuality: widget.filterQuality,
        repeat: widget.repeat,
        semanticLabel: widget.semanticLabel,
        scale: widget.scale,
        errorBuilder: widget.errorWidgetBuilder,
        loadingBuilder: widget.placeholder,
      ),
    );
  }
}

typedef PlaceholderWidgetBuilder = Widget Function(
    BuildContext context,
    Widget imageProvider,
    ImageChunkEvent? loadingProgress,
    )?;

typedef ErrorWidgetBuilder = Widget Function(
    BuildContext context,
    Object error,
    StackTrace? stackTrace,
    )?;