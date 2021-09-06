import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Values extends ChangeNotifier {
  String _enteredValue = "0";
  String _calcValue = "0";

  String _sign = "";
  num _result = 0;

  String get enteredValue => _enteredValue;
  String get calcValue => _calcValue;
  String get sign => _sign;
  num get result => _result;

  void _setResult(num val) {
    _result = val;
  }

  void setEnteredValue(String val) {
    if (enteredValue == "0") {
      _enteredValue = val;
      _calcValue = val;
      notifyListeners();
    } else {
      _enteredValue += val;

      if (val == "\u00D7") {
        val = "*";
        _calcValue += val;
      } else if (val == "\u00F7") {
        val = "/";
        _calcValue += val;
      } else {
        _calcValue += val;
      }

      notifyListeners();

      calculate(enteredValue);
    }
  }

  void calculate(String val) {
    try {
      Parser p = Parser();
      Expression exp = p.parse(calcValue);

      ContextModel cm = ContextModel();

      _setResult(exp.evaluate(EvaluationType.REAL, cm));
      notifyListeners();
    } catch (e) {}
  }

  void reset() {
    _enteredValue = "0";
    _calcValue = "0";
    _result = 0;
    notifyListeners();
  }

  void clearLast() {
    _enteredValue = _enteredValue.substring(0, _enteredValue.length - 1);
    _calcValue = _calcValue.substring(0, _calcValue.length - 1);
    calculate(enteredValue);

    if (_enteredValue == "") {
      _enteredValue = "0";
      _calcValue = "0";
      _setResult(0);
    }
    notifyListeners();
  }
}
