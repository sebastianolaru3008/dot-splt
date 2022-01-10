library counter;

import 'package:flutter/material.dart';
import 'package:split/src/theme/colors.dart';
import 'package:split/src/theme/typography.dart';

typedef CounterChangeCallback = void Function(num value);

class Counter extends StatelessWidget {
  final CounterChangeCallback onChanged;

  Counter({
    Key? key,
    required num initialValue,
    required this.minValue,
    required this.maxValue,
    required this.onChanged,
    required this.decimalPlaces,
    this.color,
    this.iconColor,
    this.textStyle,
    this.step = 1,
    this.buttonSize = 25,
  })  : selectedValue = initialValue,
        super(key: key);

  final num minValue;
  final num maxValue;
  final int decimalPlaces;
  num selectedValue;
  final num step;
  Color? color;
  Color? iconColor;
  TextStyle? textStyle;

  final double buttonSize;

  void _incrementCounter() {
    if (selectedValue + step <= maxValue) {
      onChanged((selectedValue + step));
    }
  }

  void _decrementCounter() {
    if (selectedValue - step >= minValue) {
      onChanged((selectedValue - step));
    }
  }

  @override
  Widget build(BuildContext context) {
    color = color ?? Colors.white;
    textStyle = textStyle ?? CustomTypography.b1(CustomColor.black3());

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: buttonSize,
          height: buttonSize,
          child: FloatingActionButton(
            heroTag: "dnBtn${key}",
            onPressed: _decrementCounter,
            elevation: 0,
            tooltip: 'Decrement',
            child: Icon(Icons.remove, color: iconColor),
            backgroundColor: color,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Text('${num.parse((selectedValue).toStringAsFixed(decimalPlaces))}',
              textAlign: TextAlign.center, style: textStyle),
        ),
        SizedBox(
          width: buttonSize,
          height: buttonSize,
          child: FloatingActionButton(
            heroTag: "upBtn${key}",
            onPressed: _incrementCounter,
            elevation: 0,
            tooltip: 'Increment',
            child: Icon(Icons.add, color: iconColor),
            backgroundColor: color,
          ),
        ),
      ],
    );
  }
}
