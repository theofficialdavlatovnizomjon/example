import 'package:flutter/material.dart';

class AnimatedDropdown extends StatefulWidget {
  @override
  _AnimatedDropdownState createState() => _AnimatedDropdownState();
}

class _AnimatedDropdownState extends State<AnimatedDropdown>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  bool _isDropdownOpen = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void toggleDropdown() {
    setState(() {
      _isDropdownOpen = !_isDropdownOpen;
      if (_isDropdownOpen) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: toggleDropdown,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _isDropdownOpen ? 'Close Dropdown' : 'Open Dropdown',
                  style: TextStyle(fontSize: 16),
                ),
                Icon(_isDropdownOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down),
              ],
            ),
          ),
        ),
        SizeTransition(
          sizeFactor: _animation,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            color: Colors.grey[300],
            child: Column(
              children: [
                Text('Dropdown Item 1', style: TextStyle(fontSize: 16)),
                Text('Dropdown Item 2', style: TextStyle(fontSize: 16)),
                Text('Dropdown Item 3', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}