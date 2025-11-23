import 'package:evently/core/theme/app_colors.dart';
import 'package:evently/ui/onboarding/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

class LanguageAnimatedToggleSwitch extends StatelessWidget {
  const LanguageAnimatedToggleSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedToggleSwitch.rolling(
      iconList: [
        Flag(Flags.united_states_of_america, size: 25),
        Flag(Flags.egypt, size: 25),
      ],
      height: 36,
      iconOpacity: 1,
      style: ToggleStyle(
        indicatorColor: AppColors.blue,
        borderColor: AppColors.blue,
      ),
      current: context.watch<LanguageProvider>().appLocale,
      values: [Locale('en'), Locale('ar')],
      onChanged: (language) =>
          context.read<LanguageProvider>().toggleLanguage(),
    );
  }
}
