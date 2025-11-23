import 'package:evently/core/theme/app_colors.dart';
import 'package:evently/ui/onboarding/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeIconButton extends StatelessWidget {
  const ThemeIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    final IconData icon = isDarkMode
        ? Icons.dark_mode
        : Icons.light_mode_outlined;

    return IconButton(
      onPressed: () {
        themeProvider.toggleTheme();
      },
      icon: Icon(icon, color: AppColors.white),
    );
  }
}
