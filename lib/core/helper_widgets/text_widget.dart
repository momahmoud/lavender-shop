import 'package:flutter/material.dart';
import 'package:salla_shop/core/constant/color.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final Color? color;
  final double? fontSize;
  final TextDecoration? textDecoration;
  final TextAlign? textAlign;
  final TextOverflow? overflow;

  const TextWidget({
    Key? key,
    required this.text,
    this.fontWeight,
    this.color,
    this.fontSize,
    this.textDecoration,
    this.textAlign,
    this.overflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: textDecoration,
        decorationColor: AppColor.black,
        decorationThickness: 2,
        height: 1.5,
      ),
    );
  }
}
