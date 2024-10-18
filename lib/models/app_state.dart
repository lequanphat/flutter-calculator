import 'package:flutter/foundation.dart';

class MyAppState extends ChangeNotifier {
  String username = '';
  String password = '';

  void updateUsernameInput(String value) {
    username = value;
    notifyListeners();
  }

  void updatePasswordInput(String value) {
    password = value;
    notifyListeners();
  }

  String _result = '';

  String get result => _result;

  void calculate(String operation) {
    try {
      double num1 = double.parse(operation.split(' ')[0]);
      double num2 = double.parse(operation.split(' ')[2]);
      String op = operation.split(' ')[1];

      if (op == '+') {
        _result = (num1 + num2).toString();
      } else if (op == '-') {
        _result = (num1 - num2).toString();
      } else if (op == '*') {
        _result = (num1 * num2).toString();
      } else if (op == '/') {
        _result = (num2 != 0) ? (num1 / num2).toString() : 'Error';
      } else {
        _result = 'Invalid Operation';
      }

      notifyListeners();
    } catch (e) {
      _result = 'Error';
      notifyListeners();
    }
  }
}
