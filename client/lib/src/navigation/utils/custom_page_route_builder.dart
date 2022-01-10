import 'package:flutter/material.dart';

class CustomPageRouteBuilder<T> extends PageRouteBuilder<T> {
  CustomPageRouteBuilder({required this.screen})
      : super(
            pageBuilder: (_, __, ___) => screen,
            transitionDuration: const Duration(seconds: 0),
            reverseTransitionDuration: const Duration(seconds: 0));

  final Widget screen;
}
