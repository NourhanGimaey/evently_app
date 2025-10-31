import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _appLocale = const Locale('en');

  Locale get appLocale => _appLocale;

  void toggleLanguage() {
    _appLocale = _appLocale.languageCode == 'en'
        ? const Locale('ar')
        : const Locale('en');

    notifyListeners();
  }
}
