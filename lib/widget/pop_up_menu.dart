import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopUpMenu extends StatelessWidget {
  final List<PopupMenuEntry> menuList;
  final Widget? Container;

  const PopUpMenu({Key? key, required this.menuList, this.Container})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      position: PopupMenuPosition.under,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      itemBuilder: (context) => menuList,
      child: Container,
    );
  }
}
