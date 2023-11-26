import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final double? fontSize;
  final String text;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final String? semanticsLabel;
  final Color? color;
  final TextDirection? textDirection;
  const CustomText(
      {super.key,
      this.fontSize,
      required this.text,
      this.fontWeight,
      this.textAlign,
      this.semanticsLabel,
      this.color,
      this.textDirection});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color ?? Colors.white,
          fontSize: fontSize,
          fontFamily: "Cairo",
          fontWeight: fontWeight),
      textAlign: textAlign ?? TextAlign.center,
      textDirection: textDirection ?? TextDirection.ltr,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}