import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelerapp/utils/colors.dart';
import 'package:travelerapp/widget/big_text.dart';

class CommunButton extends StatelessWidget {
  bool hadText;
  String text;
  Color color;
  bool centered;
  double width;
  double height;
  double borderRadius;

  CommunButton(
      {Key? key,
      this.height = 60,
      this.width = 100,
      this.hadText = false,
      this.text = '',
      this.centered = false,
      this.borderRadius = 20,
      this.color = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        alignment: Alignment.topCenter,
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: AppColors.purpleColor,
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
                        child: BigText(
                          text: hadText ? text : '',
                          isBold: false,
                          size: 20,
                          textColor: Colors.white,
                        ),
                      )
                    : Container(),
              ),
              centered
                  ? const Center(
                      child: Image(
                      image: AssetImage('assets/image/button-one.png'),
                    ))
                  : const Image(
                      image: AssetImage('assets/image/button-one.png')),
            ],
          ),
        ),
      ),
    );
  }
}
