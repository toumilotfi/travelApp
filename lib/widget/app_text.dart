import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppText extends StatelessWidget {
  String text;
  double? size;
  Color? textColor;
  bool isBold;
  TextOverflow overflow;
  double letterSpacing;
  double wordSpacing;
  TextDecoration? textDecoration;
  Color decorationColor;
  TextDecorationStyle? decorationStyle;
  double? decorationThickness;
  double? textHeight;
  int? maxLine;

  AppText({
    Key? key,
    this.maxLine,
    this.decorationStyle,
    this.textHeight,
    this.decorationThickness,
    this.decorationColor = Colors.black,
    this.textDecoration,
    this.wordSpacing = 3,
    this.letterSpacing = 1,
    this.overflow = TextOverflow.visible,
    required this.text,
    this.size = 1000,
    this.textColor = Colors.black87,
    this.isBold = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size == 1000 ? size = 0.02.sh : 16;
    return Text(
      text,
      maxLines: maxLine,
      style: TextStyle(
        fontSize: size,
        color: textColor,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        decoration: textDecoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        height: textHeight,
      ),
      overflow: overflow,
    );
  }
}
