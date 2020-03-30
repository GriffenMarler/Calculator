import 'package:flutter/material.dart';

// This file provides global variables that can be easily changed
// to format the calculator. This is heavily based off Kent's example
// with my values imported and some new variables added. 

// The constraints for each key
const keyconstraints = BoxConstraints(
    maxHeight: 100.0, maxWidth: 100.0, minWidth: 100.0, minHeight: 100.0);

// The constraints for the zero key
const zerokeyconstraints = BoxConstraints(
    maxHeight: 100.0, maxWidth: 200.0, minHeight: 100.0, minWidth: 200.0);

// Display screen
const displayconstraints = BoxConstraints(
    maxHeight: 100.0, maxWidth: 300.0, minWidth: 300.0, minHeight: 100.0);

// Constraints for entire screen
const screenConstraints = BoxConstraints(
  maxHeight: 100.0,
  maxWidth: 400.0,
  minHeight: 50.0,
  minWidth: 200.0,
);

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

// Normal text
const fstyle = FontStyle.normal;

const fontsize = 60.0;

// The Color of each key
const keyColor = Color.fromARGB(255, 91, 92, 95);

// Color when key is tapped
const keyColorTapped = Color.fromARGB(255, 141, 142, 145);

// The Color of each key's font
const fontColor = Colors.black;

// The Color of each calculator
var calcColor = Color.fromARGB(255, 57, 56, 59);

// Lambda that gives me a text object for a key
Text keyText(String key, double fontSize) =>
    Text(key, style: TextStyle(fontSize: fontSize, color: fontColor));

// Lambda that gives me a text object for the display
Text displayText(String key, double fontSize) =>
    Text(key, style: TextStyle(fontSize: fontSize, color: fontColor));

// width of key and screen border
double borderWidth = 5;
