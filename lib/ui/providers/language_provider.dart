import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier{
   String locale = "en";

   void changeLanguage(String newLocale){
    locale = newLocale;
    notifyListeners();
  }
}