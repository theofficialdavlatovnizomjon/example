import 'package:flutter/widgets.dart';

import 'tweens/delay_tween.dart';

class SpinKitFadingCube extends StatefulWidget {
  const SpinKitFadingCube({
    Key? key,
    this.color,
    this.size = 50.0,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 2400),
    this.controller,
  })  : assert(
          !(itemBuilder is IndexedWidgetBuilder && color is Color) && !(itemBuilder == null && color == null),
          'You should specify either a itemBuilder or a color',
        ),
        super(key: key);

  final Color? color;
  final double size;
  final IndexedWidgetBuilder? itemBuilder;
  final Duration duration;
  final AnimationController? controller;

  @override
  State<SpinKitFadingCube> createState() => _SpinKitFadingCubeState();
}

class _SpinKitFadingCubeState extends State<SpinKitFadingCube> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ?? AnimationController(vsync: this, duration: widget.duration))..repeat();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.fromSize(
        size: Size.square(widget.size),
        child: Center(
          child: Transform.rotate(
            angle: -45.0 * 0.0174533,
            child: Stack(
              children: List.generate(4, (i) {
                final size = widget.size * 0.5, position = widget.size * .5;
                return Positioned.fill(
                  top: position,
                  left: position,
                  child: Transform.scale(
                    scale: 1.1,
                    origin: Offset(-size * .5, -size * .5),
                    child: Transform(
                      transform: Matrix4.rotationZ(90.0 * i * 0.0174533),
                      child: Align(
                        alignment: Alignment.center,
                        child: FadeTransition(
                          opacity: DelayTween(
                            begin: 0.0,
                            end: 1.0,
                            delay: 0.3 * i,
                          ).animate(_controller),
                          child: SizedBox.fromSize(
                            size: Size.square(size),
                            child: _itemBuilder(i),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  Widget _itemBuilder(int index) => widget.itemBuilder != null
      ? widget.itemBuilder!(context, index)
      : DecoratedBox(decoration: BoxDecoration(color: widget.color));
}
