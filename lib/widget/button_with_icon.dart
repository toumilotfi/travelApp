import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelerapp/widget/app_text.dart';

class ButtonWithIcon extends StatelessWidget {
  bool hadText;
  String text;
  Color color;
  bool centered;
  double width;
  double height;
  double borderRadius;
  Color bachgroundColor;
  double textSize;

  ButtonWithIcon(
      {Key? key,
      this.textSize = 20,
      this.height = 60,
      this.bachgroundColor = Colors.white,
      this.width = 100,
      this.hadText = false,
      this.text = '',
      this.centered = false,
      this.borderRadius = 20,
      this.color = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: bachgroundColor,
          borderRadius: BorderRadius.circular(borderRadius)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: hadText
                  ? Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: AppText(
                        text: hadText ? text : '',
                        isBold: true,
                        size: textSize,
                        textColor: color,
                      ),
                    )
                  : Container(),
            ),
            Icon(Icons.fast_forward_outlined)
          ],
        ),
      ),
    );
  }
}
