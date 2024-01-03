import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;

  const CustomText({super.key, required this.text, this.fontSize, this.fontWeight, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: textColor, fontWeight: fontWeight, fontSize: fontSize),
    );
  }
}
