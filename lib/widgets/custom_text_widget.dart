import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget(
      {Key? key,
      required this.text,
      this.textColor = Colors.white,
      this.fontSize})
      : super(key: key);

  final String text;
  final Color textColor;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.justify,
    );
  }
}
