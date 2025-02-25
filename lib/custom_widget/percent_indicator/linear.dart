import 'package:flutter/material.dart';

class LinearIndicator extends StatelessWidget {
  final double height, width, proBorder, indBorder;

  final Color proColor, indColor;
  final double percent;

  const LinearIndicator({
    super.key,
    required this.percent,
    required this.height,
    required this.width,
    required this.proColor,
    required this.indColor,
    required this.proBorder,
    required this.indBorder,
  });

  @override
  Widget build(BuildContext context) => Container(
        height: 115,
        width: 18,
        decoration: BoxDecoration(
          color: proColor,
          borderRadius: BorderRadius.circular(proBorder),
        ),
        child: FractionallySizedBox(
          widthFactor: percent,
          child: Container(
            decoration: BoxDecoration(
              color: indColor,
              borderRadius: BorderRadius.circular(indBorder),
            ),
          ),
        ),
      );
}
