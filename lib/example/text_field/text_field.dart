import 'package:flutter/material.dart';

class AnimatedTextField extends StatefulWidget {
  @override
  _AnimatedTextFieldState createState() => _AnimatedTextFieldState();
}

class _AnimatedTextFieldState extends State<AnimatedTextField>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = Tween<double>(begin: 14, end: 24).animate(_animationController);
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: 200,
          child: TextField(
            style: TextStyle(fontSize: _animation.value),
            decoration: InputDecoration(
              labelText: 'Enter text',
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}