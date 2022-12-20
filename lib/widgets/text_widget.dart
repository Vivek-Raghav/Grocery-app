import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  TextWidget(
      {super.key,
      required this.text,
      required this.color,
      required this.textSize,
      this.istitle = false,
      this.maxlines = 5});

  final String text;
  final Color color;
  final double textSize;
  bool istitle = false;
  int maxlines = 10;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxlines,
      style: TextStyle(
          overflow: TextOverflow.ellipsis,
          fontSize: textSize,
          fontWeight: istitle ? FontWeight.bold : FontWeight.normal,
          color: color),
    );
  }
}
