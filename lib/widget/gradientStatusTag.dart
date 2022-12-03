import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GradientStatusTag extends StatelessWidget {
  const GradientStatusTag({
    Key? key,
    required this.PlaceStatus,
  }) : super(key: key);

  final String PlaceStatus;

  @override
  Widget build(BuildContext context) {
    String text;
    List<Color> colors = [Colors.cyan, Colors.blue.shade600];
    switch (PlaceStatus) {
      case 'Popular':
        text = 'Popular places';
        colors = [Colors.amber, Colors.orange.shade600];
        break;
      case 'recommended':
        text = 'Event';
        colors = [Colors.cyan, Colors.blue.shade600];
        break;
    }
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: colors,
          )),
      child: Text(PlaceStatus),
    );
  }
}
