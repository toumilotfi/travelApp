import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelerapp/widget/big_text.dart';

class SmallIconButton extends StatelessWidget {
  double width;
  double height;
  double borderRadius;
  Color color;
  String contentType;
  Icon? icon;
  String text;
  String imagePath;
  BigText? bigText;
  Color borderColor;

  SmallIconButton(
      {Key? key,
      this.width = 45,
      this.height = 45,
      this.borderRadius = 10,
      this.color = Colors.white,
      required this.contentType,
      this.icon,
      this.imagePath = '',
      this.text = '',
      this.bigText,
      this.borderColor = Colors.transparent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(borderRadius),
          color: color),
      child: contentType == 'text'
          ? Center(child: bigText)
          : contentType == 'icon'
              ? Center(child: icon)
              : Image(image: AssetImage(imagePath)),
    );
  }
}
