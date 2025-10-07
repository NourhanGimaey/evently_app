import 'package:evently/core/utils/app_colors.dart';
import 'package:evently/ui/home/provider/main_layout_provider.dart';
import 'package:evently/ui/home/widgets/home_bottom_appBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 10,
      child: Scaffold(
        body: Consumer<MainLayoutProvider>(
          builder: (context, provider, child) {
            return provider.tabs[provider.currentIndex];
          },
        ),
        bottomNavigationBar: const HomeBottomAppbar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.blue,
          foregroundColor: AppColors.white,
          shape: const CircleBorder(),
          child: const Icon(Icons.add),
          onPressed: () {},
        ),
      ),
    );
  }
}
