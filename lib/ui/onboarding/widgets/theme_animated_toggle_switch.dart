import 'package:evently/core/utils/app_colors.dart';
import 'package:evently/ui/onboarding/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

class ThemeAnimatedToggleSwitch extends StatelessWidget {
  const ThemeAnimatedToggleSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedToggleSwitch.rolling(
      iconList: [Icon(LineAwesome.sun), Icon(LineAwesome.moon)],
      indicatorIconScale: 1.1,
      height: 36,
      iconOpacity: 1,
      style: ToggleStyle(
        indicatorColor: AppColors.blue,
        borderColor: AppColors.blue,
      ),
      current: context.watch<ThemeProvider>().themeMode,
      values: [ThemeMode.light, ThemeMode.dark],
      onChanged: (theme) => context.read<ThemeProvider>().toggleTheme(),
    );
  }
}
