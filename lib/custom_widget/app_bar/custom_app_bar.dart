import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height, horizontalPadding, topPadding, borderRadius;
  final Color backgroundColor;
  final Widget? leading, titleLeading, subLeading;
  final String title;
  final TextStyle? titleStyle;

  const CustomAppBar({
    super.key,
    this.height = 80,
    this.horizontalPadding = 12,
    this.topPadding = 15,
    this.backgroundColor = Colors.transparent,
    this.borderRadius = 0,
    this.leading,
    this.title = '',
    this.titleLeading,
    this.titleStyle,
    this.subLeading,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(borderRadius),
          ),
        ),
        padding: EdgeInsets.only(
          left: horizontalPadding,
          top: topPadding,
          right: horizontalPadding,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: titleLeading == null
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.spaceBetween,
              children: [
                leading == null ? const SizedBox() : leading!,
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: titleStyle,
                ),
                titleLeading == null ? const SizedBox() : titleLeading!,
              ],
            ),
            subLeading == null ? const SizedBox() : subLeading!,
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.maxFinite, height);
}
