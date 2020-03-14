import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// Color of each number and decimal key
const keycolor = Color.fromARGB(255, 194, 32, 51);

// Color of each key border
const bordercolor = Colors.black;

// Color of display box
const displaycolor = Colors.green;

// Applicaiton background color
const backgroundcolor = Color.fromARGB(255, 0, 0, 0);

// Key color taken directly from Whitworth's brand guide (Pantone 200C)
// https://www.whitworth.edu/cms/media/whitworth/documents/administration/marketing-amp-communications/brand-amp-identity/whitworth-university-brand-guide.pdf
const specialkeycolor = Color.fromARGB(255, 200, 183, 132);

// Operation key color taken directly from Whitworth's brand guide (Pantone 4525C)
// https://www.whitworth.edu/cms/media/whitworth/documents/administration/marketing-amp-communications/brand-amp-identity/whitworth-university-brand-guide.pdf
const operationkeycolor = Color.fromARGB(255, 200, 183, 132);

const fstyle = FontStyle.normal;

const fontsize = 60.0;

const equalkeyconstraints = BoxConstraints(
    maxHeight: 200.0, maxWidth: 100.0, minHeight: 200.0, minWidth: 100.0);

const zerokeyconstraints = BoxConstraints(
    maxHeight: 100.0, maxWidth: 200.0, minHeight: 100.0, minWidth: 200.0);

// Display screen
const displayconstraints = BoxConstraints(
    maxHeight: 100.0, maxWidth: 300.0, minWidth: 300.0, minHeight: 100.0);

const keyconstraints = BoxConstraints(
    maxHeight: 100.0, maxWidth: 100.0, minWidth: 100.0, minHeight: 100.0);

// https://api.flutter.dev/flutter/painting/BoxDecoration-class.html
// Used the link above to help me understand Box decoration class
// Function that returns a key object
Center key(
  var _keycolor,
  var _constraints,
  FontStyle _fstyle,
  var _fontsize,
  var keytext,
) {
  return Center(
      child: Container(
          decoration: BoxDecoration(
            color: _keycolor,
            border: Border.all(
              color: Colors.black, // Border for all the keys
              width: 8,
            ),
            borderRadius: BorderRadius.circular(
                12), // Border style taken from Kent's code
          ),
          child: Center(
              child: new Text(keytext,
                  textAlign: TextAlign.center, // Allign the text in the center
                  style: TextStyle(
                    fontStyle: _fstyle,
                    fontSize: _fontsize,
                  ))),
          constraints: _constraints));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'WhitCalc',
        home: Scaffold(
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
                key(displaycolor, displayconstraints, fstyle, fontsize, ""),
                Padding(
                  padding: EdgeInsets.all(14.0),
                ),
                // Row 1
                Row(
                  // First row of keys AC, +/-, %, and division
                  children: <Widget>[
                    key(specialkeycolor, keyconstraints, fstyle, fontsize,
                        "AC"),
                    key(specialkeycolor, keyconstraints, fstyle, fontsize,
                        "+/-"),
                    key(specialkeycolor, keyconstraints, fstyle, fontsize, "%"),
                    key(operationkeycolor, keyconstraints, fstyle, fontsize,
                        "\u00F7"),
                  ],
                ),
                // Row 2
                Row(
                  // Second row of keys
                  children: <Widget>[
                    key(keycolor, keyconstraints, fstyle, fontsize, "7"),
                    key(keycolor, keyconstraints, fstyle, fontsize, "8"),
                    key(keycolor, keyconstraints, fstyle, fontsize, "9"),
                    key(operationkeycolor, keyconstraints, fstyle, fontsize,
                        "\u00D7"),
                  ],
                ),
                // Row 3
                // Third row of keys
                Row(
                  children: <Widget>[
                    key(keycolor, keyconstraints, fstyle, fontsize, "4"),
                    key(keycolor, keyconstraints, fstyle, fontsize, "5"),
                    key(keycolor, keyconstraints, fstyle, fontsize, "6"),
                    key(operationkeycolor, keyconstraints, fstyle, fontsize,
                        "+"),
                  ],
                ),
                // Row 4
                // Fourth row of keys
                Row(
                  children: <Widget>[
                    key(keycolor, keyconstraints, fstyle, fontsize, "1"),
                    key(keycolor, keyconstraints, fstyle, fontsize, "2"),
                    key(keycolor, keyconstraints, fstyle, fontsize, "3"),
                    key(operationkeycolor, keyconstraints, fstyle, fontsize,
                        "-"),
                  ],
                ),
                // Row 5
                Row(
                  // Fifth row of keys
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    key(keycolor, zerokeyconstraints, fstyle, fontsize, "0"),
                    key(keycolor, keyconstraints, fstyle, fontsize, "."),
                    Flexible(
                        child: key(operationkeycolor, keyconstraints, fstyle,
                            fontsize, "=")),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
