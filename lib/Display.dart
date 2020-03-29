import 'package:flutter/material.dart';
import 'CalcUtils.dart';

class CalcDisplay extends StatefulWidget {
  final String lcdDisplay;

  CalcDisplay({Key key, @required this.lcdDisplay}) : super(key: key);

  _CalcDisplay createState() => _CalcDisplay();
}

class _CalcDisplay extends State<CalcDisplay> {
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: displaycolor,
          border: Border.all(
            color: calcColor,
            width: borderWidth,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        constraints: displayconstraints,
        alignment: Alignment.bottomRight,
        child: displayText(widget.lcdDisplay, 50.0));
  }
}
