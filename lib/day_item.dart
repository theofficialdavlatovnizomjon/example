import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DayItem extends StatelessWidget {
  const DayItem(
      {super.key,
      required this.data,
      required this.nextData,
      this.textColor,
      this.color,
      this.svg});

  final Color? color;
  final Color? textColor;
  final DateTime data;
  final DateTime nextData;
  final String? svg;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      alignment: Alignment.center,
      padding: const EdgeInsets.fromLTRB(6, 4, 6, 4),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: const Color(0xffEEEEEE),
          width: 0.5,
        ),
      ),
      child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            '${data.day}',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: textColor ?? Color(0xff212121),
              fontSize: 16.0,
            ),
          ),
          Text(
            '${nextData.day}',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: textColor ?? Color(0xff212121),
              fontSize: 12.0,
            ),
          ),
        ]),
        const Spacer(),
        if (svg?.isNotEmpty ?? false)
          SizedBox(
            width: 20,
            height: 20,
            child: SvgPicture.asset(svg ?? ''),
          ),
      ]),
    );
  }
}
