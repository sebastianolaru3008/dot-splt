import 'package:flutter/material.dart';

class CustomBottomAppBarItem extends StatelessWidget {
  const CustomBottomAppBarItem(
      {Key? key, required this.icon, required this.label})
      : super(key: key);

  final Widget icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Tab(
      icon: icon,
      text: label,
      iconMargin: const EdgeInsets.fromLTRB(
        0.0,
        4.0,
        0.0,
        4.0,
      ),
    );
  }
}
