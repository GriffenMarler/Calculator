import 'package:flutter/material.dart';
import 'CalcUtils.dart';
import 'CalcKey.dart';
import 'Display.dart';
import 'Alu.dart';

class Calculator extends StatefulWidget {
  Calculator({Key key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

// The Calculator contains an ALU that is
// constructed only one time on build.
class _CalculatorState extends State<Calculator> {
  String _lcdDisplay = "";
  bool _first = true;
  var _alu;

  // function for childe to call in order
  // to update the state of this widget
  void callback() {
    setState(() {
      // Update the display string from
      // the alu
      _lcdDisplay = _alu.buf;
    });
  }

  Widget build(BuildContext context) {
    // On first build create an ALU object
    // and pass the callback function to it.
    // setState sets the _lcdDisplay string to
    // the alu string buffer called buf
    // it re-draws the widget too.
    if (_first) {
      // Set the flag so we only do this one time.
      _first = false;

      // Create an ALU object and give it a callback
      // function
      _alu = Alu(update: callback);
    }
    return Scaffold(
      backgroundColor: backgroundcolor,
      appBar: AppBar(
        // https://www.woolha.com/tutorials/flutter-display-and-adjust-images-from-assets
        // https://stackoverflow.com/questions/49983931/how-to-replace-title-with-image-in-appbar
        // Used the above links to help me get an image in the AppBar
        title: Image.network(
          'https://golinfieldwildcats.com/images/logos/Whitworth.png',
          height: 80,
          width: 80,
        ),
        // Make the image in the center
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // Create the display key
            CalcDisplay(lcdDisplay: _lcdDisplay),
            Padding(
              padding: EdgeInsets.all(14.0),
            ),
            // Row 1
            Row(
              mainAxisSize: MainAxisSize.min,
              // First row of keys AC, +/-, %, and division
              children: <Widget>[
                // Use Kent's Calckey function with my calcutils to work with my calculator design. 
                CalcKey(
                  alu: _alu,
                  keyString: 'AC',
                  color: operationkeycolor,
                ),
                CalcKey(
                  alu: _alu,
                  keyString: '+/-',
                  color: operationkeycolor,
                ),
                CalcKey(
                  alu: _alu,
                  keyString: '%',
                  color: operationkeycolor,
                ),
                CalcKey(
                  alu: _alu,
                  keyString: '\u00F7',
                  color: operationkeycolor,
                ),
              ],
            ),
            // Row 2
            Row(
              mainAxisSize: MainAxisSize.min,
              // Second row of keys
              children: <Widget>[
                CalcKey(
                  alu: _alu,
                  keyString: '7',
                  color: keycolor,
                ),
                CalcKey(
                  alu: _alu,
                  keyString: '8',
                  color: keycolor,
                ),
                CalcKey(
                  alu: _alu,
                  keyString: '9',
                  color: keycolor,
                ),
                CalcKey(
                  alu: _alu,
                  keyString: '\u00D7',
                  color: operationkeycolor,
                ),
              ],
            ),
            // Row 3
            // Third row of keys
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CalcKey(
                  alu: _alu,
                  keyString: '4',
                  color: keycolor,
                ),
                CalcKey(
                  alu: _alu,
                  keyString: '5',
                  color: keycolor,
                ),
                CalcKey(
                  alu: _alu,
                  keyString: '6',
                  color: keycolor,
                ),
                CalcKey(
                  alu: _alu,
                  keyString: '+',
                  color: operationkeycolor,
                ),
              ],
            ),
            // Row 4
            // Fourth row of keys
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CalcKey(
                  alu: _alu,
                  keyString: '1',
                  color: keycolor,
                ),
                CalcKey(
                  alu: _alu,
                  keyString: '2',
                  color: keycolor,
                ),
                CalcKey(
                  alu: _alu,
                  keyString: '3',
                  color: keycolor,
                ),
                CalcKey(
                  alu: _alu,
                  keyString: '-',
                  color: operationkeycolor,
                ),
              ],
            ),
            // Row 5
            Row(
              // Fifth row of keys
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CalcKey(
                  alu: _alu,
                  keyString: '0',
                  color: keycolor,
                  constraints: zerokeyconstraints,
                ),
                CalcKey(
                  alu: _alu,
                  keyString: '.',
                  color: keycolor,
                ),
                CalcKey(
                  alu: _alu,
                  keyString: '=',
                  color: operationkeycolor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
