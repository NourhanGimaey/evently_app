import 'package:evently/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CustomToggleTheme extends StatelessWidget {
  final bool language;
  const CustomToggleTheme({super.key, this.language = true});

  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      totalSwitches: 2,
      icons: language
          ? const [Icons.arrow_back, Icons.arrow_forward]
          : const [Icons.light_mode, Icons.dark_mode_outlined],
      minWidth: 50.0,
      minHeight: 30.0,
      cornerRadius: 16,
      activeFgColor: AppColors.white,
      inactiveBgColor: AppColors.grey,
      inactiveFgColor: AppColors.white,
      radiusStyle: true,
      activeBgColors: [
        [AppColors.blue],
        [AppColors.blue],
      ],
    );
  }
}
