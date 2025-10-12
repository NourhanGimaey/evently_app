import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _appLocale = const Locale('en'); 

  Locale get appLocale => _appLocale;
  void toggleLanguage(Locale language) {
    language == Locale('en') ? Locale('ar') : Locale('en');
    _appLocale = language;
    notifyListeners();
  }
}