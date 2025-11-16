import 'package:evently/core/utils/app_colors.dart';
import 'package:evently/l10n/localization/app_localizations.dart';
import 'package:evently/ui/onboarding/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomThemeDropdown extends StatelessWidget {
  const CustomThemeDropdown({super.key});

  String _getThemeDisplayName(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.dark:
        return 'Dark';
      case ThemeMode.system:
        return 'System';
    }
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations locale = AppLocalizations.of(context)!;
    final themeProvider = context.watch<ThemeProvider>();
    final currentThemeMode = themeProvider.themeMode;
    final List<ThemeMode> supportedThemes = [ThemeMode.light, ThemeMode.dark];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          locale.theme,
          style: themeProvider.themeMode == ThemeMode.light
              ? Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(color: AppColors.black)
              : Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(color: AppColors.white),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: themeProvider.themeMode == ThemeMode.light
                ? AppColors.white
                : AppColors.black,
            border: Border.all(color: AppColors.blue, width: 1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: DropdownButton<ThemeMode>(
            borderRadius: BorderRadius.circular(16),
            value: currentThemeMode,
            onChanged: (ThemeMode? newThemeMode) {
              if (newThemeMode != null) {
                themeProvider.toggleTheme();
              }
            },
            isExpanded: true,
            selectedItemBuilder: (BuildContext context) {
              return supportedThemes.map<Widget>((ThemeMode mode) {
                return Text(
                  _getThemeDisplayName(mode),
                  style: Theme.of(context).textTheme.titleMedium,
                );
              }).toList();
            },
            items: supportedThemes.map<DropdownMenuItem<ThemeMode>>((
              ThemeMode mode,
            ) {
              return DropdownMenuItem<ThemeMode>(
                value: mode,
                child: Text(
                  _getThemeDisplayName(mode),
                  style: const TextStyle(fontSize: 20),
                ),
              );
            }).toList(),
            icon: const Icon(
              Icons.arrow_drop_down,
              color: AppColors.blue,
              size: 32,
            ),
          ),
        ),
      ],
    );
  }
}
