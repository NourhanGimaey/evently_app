import 'package:evently/ui/tabs/favorite_tab/screens/favorite_tab.dart';
import 'package:evently/ui/tabs/home_tab/screens/home_tab.dart';
import 'package:evently/ui/tabs/maps_tab/screens/maps_tab.dart';
import 'package:evently/ui/tabs/profile_tab/screens/profile_tab.dart';
import 'package:flutter/material.dart';

class MainLayoutProvider extends ChangeNotifier {
  int currentIndex = 1;
  List<Widget> tabs = [HomeTab(), MapsTab(), FavoriteTab(), ProfileTab()];

  void changeTab(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
