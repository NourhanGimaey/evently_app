import 'package:flutter/material.dart';

class HomeTabProvider extends ChangeNotifier {
  int currentIndex = 0;

  void changeHomeTab(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
