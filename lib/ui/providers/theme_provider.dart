import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode currentMode = ThemeMode.light;

  void changeMode(ThemeMode mode){
    currentMode = mode;
    notifyListeners();
  }
}