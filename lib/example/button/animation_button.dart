import 'package:flutter/material.dart';

class MyElevatedButton extends StatefulWidget {
  @override
  _MyElevatedButtonState createState() => _MyElevatedButtonState();
}

class _MyElevatedButtonState extends State<MyElevatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    _animation = Tween<double>(begin: 1.0, end: 0.9).animate(_animationController);
    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: Transform.scale(
        scale: _animation.value,
        child: ElevatedButton(
          onPressed: () {
            // Akcija koju treba izvršiti
          },
          child: Text("Uzdignuto dugme"),
        ),
      ),
    );
  }

  void _onTapDown(TapDownDetails details) {
    _animationController.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _animationController.reverse();
  }

  void _onTapCancel() {
    _animationController.reverse();
  }
}