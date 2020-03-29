const int precision = 9;

enum Operation { add, sub, mul, div, percent, ac, posneg }

class Alu {
  String buf = ""; // Holds string for display widget
  double accY = 0; // Holds current double value
  double accX = 0; // X register for X - Y, X + y etc;
  Operation op;

  bool decimal = false; // If decimal point has been entered
  bool displayHasAnswer = false; // If an answer is in the display

// Callback function to notify parent of change
  void Function() update;

  // Constructor for ALU
  Alu({this.accY = 0.0, this.update});

  void _initOperation(Operation oper) {
    decimal = false;
    op = oper;

    // Only move Y to X if an answer is NOT
    // in the display
    if (!displayHasAnswer) accX = accY;
    buf = "";
  }

  // Clear accumaltors

  void _doAC() {
    accY = 0.0;
    buf = "";
    decimal = false;
  }

  String _removeTrailingZeros(String s) {
    if (s[s.length - 1] != "0" || !s.contains(".")) {
      return s;
    } else {
      return _removeTrailingZeros(s.substring(0, s.length - 1));
    }
  }

// Execute the corrent operation after "=" is pressed
  void _doOperation() {
    switch (op) {
      case Operation.add:
        accX = accX + accY;
        buf = _removeTrailingZeros(accX.toStringAsPrecision(precision));
        break;
      case Operation.sub:
        accX = accX - accY;
        buf = _removeTrailingZeros(accX.toStringAsPrecision(precision));
        break;
      case Operation.mul:
        accX = accX * accY;
        buf = _removeTrailingZeros(accX.toStringAsPrecision(precision));
        break;
      case Operation.div:
        accX = accX / accY;
        buf = _removeTrailingZeros(accX.toStringAsPrecision(precision));
        break;
      case Operation.percent:
        accX = (accX / 100.0) * accY;
        buf = _removeTrailingZeros(accX.toStringAsPrecision(precision));
        break;
      case Operation.ac:
        _doAC();
        break;
      // Function that I added for the +/- functionality I included on my calculator
      case Operation.posneg:
        // Change the number to either positive or negative by multiplying it by -1
        accX = accX * -1;
        buf = _removeTrailingZeros(accX.toStringAsPrecision(precision));
        break;
      default:
        _doAC();
        buf = "Err";
        break;
    }
  }

  void pressed(String d) {
    if ("0123456789".contains(d)) {
      if (displayHasAnswer) {
        _doAC(); // Clear display first
        displayHasAnswer = false;
      }
      if (buf.length < 10) buf += d;
      accY = double.parse(buf);
    } else if (d == "+") {
      _initOperation(Operation.add);
    } else if (d == "-") {
      _initOperation(Operation.sub);
    } else if (d == "%") {
      _initOperation(Operation.percent);
    } else if (d == "\u00F7") {
      _initOperation(Operation.div);
    } else if (d == "\u00D7") {
      _initOperation(Operation.mul);
    } else if (d == "AC") {
      op = Operation.ac;
      _doOperation();
    } else if (d == "=") {
      _doOperation();
      displayHasAnswer = true;
    } else if (d == "+/-") {
      _initOperation(Operation.posneg);
    } else if (d == "." && decimal == false) {
      // Start entering a decimal number
      if (displayHasAnswer) {
        _doAC(); // Clear display first
        displayHasAnswer = false;
      }
      if (buf.length < 10) buf += ".";
      decimal = true;
      accY = double.parse(buf);
    }
    this.update();
  }
}
