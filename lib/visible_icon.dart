import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:space_x/global.dart';

class VisibleIcon extends ChangeNotifier {
  get isVisible => _isVisible;
  bool _isVisible = false;
  set isVisible(value) {
    _isVisible = value;
    notifyListeners();
  }

  get isValid => _isValid;
  bool _isValid = false;
  void isValidUserName(String input) {
    if (input == Global.validUserName.first) {
      _isValid = true;
    } else {
      _isValid = false;
    }
    notifyListeners();
  }
}
