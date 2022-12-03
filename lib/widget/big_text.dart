import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  String text;
  double? size;
  Color? textColor;
  bool isBold;

  BigText({
    Key? key,
    required this.text,
    this.size = 30,
    this.textColor = Colors.black,
    this.isBold = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size,
          color: textColor,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
    );
  }
}
