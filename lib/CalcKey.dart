///////////////////////////////////////////////////////////////////////
// The CalcKey class makes stateful widgets
// for each key in the calculator
///////////////////////////////////////////////////////////////////////
///
import 'package:flutter/material.dart';
import 'CalcUtils.dart';
import 'Alu.dart';

// This is the calculator key class that helps create the design and formatting
// for each specific calculator key
class CalcKey extends StatefulWidget {
  final String keyString;
  final double fontSize;
  final Color color;
  final BoxConstraints constraints;
  final FontStyle style;
  final Color fontcolor;
  final Alu alu;

// Constructor
  CalcKey(
      {Key key,
      this.keyString = "",
      this.fontSize = fontsize,
      this.color = keycolor,
      this.constraints = keyconstraints,
      this.style = fstyle,
      this.fontcolor = fontColor,
      this.alu})
      : super(key: key);

  _CalcKeyState createState() => _CalcKeyState();
}

// Stores the state for the CalcKey class
class _CalcKeyState extends State<CalcKey> {
  // The amount of time to allocate to each tap
  final msec100 = Duration(milliseconds: 100);

  //  The state of this key
  bool _isTapped = false;

  // Animate the key color to give feedback for tap
  Future<void> toggleCalcKeyDisplay() async {
    // send the key press to the alu
    widget.alu.pressed(widget.keyString);
    setState(() {
      _isTapped = !_isTapped;
    });
    await Future.delayed(msec100);
    setState(() {
      _isTapped = !_isTapped;
    });
  }

  Widget build(BuildContext context) {
    return GestureDetector(

        // Handle a key tap...
        onTap: () {
          toggleCalcKeyDisplay();
        },
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              // adjust the color based on _isTapped state
              color: _isTapped
                  ? keyColorTapped
                  : widget.color, // the key background color
              border: Border.all(
                color: calcColor, // the border color
                width: borderWidth,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            constraints: widget.constraints,
            alignment: Alignment.center,
            child: keyText(widget.keyString, widget.fontSize),
          ),
        ));
  }
}
