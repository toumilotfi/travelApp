import 'package:flutter/cupertino.dart';

class AnimationCurve extends Curve {
  @override
  double tranformInternal(double t) {
    var myValue;
    if (t <= 0.5) {
      myValue = -(0.5 - t) * 2;
    } else {
      myValue = -(1 - (t * 2));
    }

    return myValue;
  }
}
