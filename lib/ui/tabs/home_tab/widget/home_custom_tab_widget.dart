import 'package:evently/core/utils/app_colors.dart';
import 'package:evently/ui/onboarding/provider/theme_provider.dart';
import 'package:evently/ui/tabs/home_tab/provider/home_tab_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeCustomTab extends StatelessWidget {
  final String tabName;
  final IconData customIcon;
  final int index;
  const HomeCustomTab({
    super.key,
    required this.tabName,
    required this.customIcon,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return Consumer<HomeTabProvider>(
      builder: (context, provider, child) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(46),
            color:
                provider.currentIndex == index &&
                    themeProvider.themeMode == ThemeMode.light
                ? AppColors.white
                : themeProvider.themeMode == ThemeMode.light
                ? Colors.transparent
                : AppColors.black,
            border: Border.all(color: AppColors.white, width: 1),
          ),
          height: 40,
          child: Row(
            children: [
              Icon(
                customIcon,
                color: provider.currentIndex == index
                    ? AppColors.blue
                    : AppColors.white,
              ),
              SizedBox(width: 8),
              Text(
                tabName,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: provider.currentIndex == index
                      ? AppColors.blue
                      : AppColors.white,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
