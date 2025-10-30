import 'package:evently/ui/tabs/favorite_tab/screens/favorite_tab.dart';
import 'package:evently/ui/tabs/home_tab/screens/home_tab.dart';
import 'package:evently/ui/tabs/maps_tab/provider/map_tab_provider.dart';
import 'package:evently/ui/tabs/maps_tab/screens/maps_tab.dart';
import 'package:evently/ui/tabs/profile_tab/screens/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainLayoutProvider extends ChangeNotifier {
  int currentIndex = 0;
  List<Widget> tabs = [
    const HomeTab(),
    ChangeNotifierProvider(
      create: (context) => MapTabProvider(),
      child: const MapTab(),
    ),
    const FavoriteTab(),
    const ProfileTab(),
  ];

  void changeTab(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
