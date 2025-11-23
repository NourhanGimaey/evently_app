import 'package:evently/core/theme/app_colors.dart';
import 'package:evently/l10n/localization/app_localizations.dart';
import 'package:evently/ui/onboarding/provider/language_provider.dart';
import 'package:evently/ui/onboarding/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomLanguageDropdown extends StatelessWidget {
  const CustomLanguageDropdown({super.key});

  String _getLanguageDisplayName(BuildContext context, Locale locale) {
    if (locale.languageCode == 'en') {
      return 'English';
    } else if (locale.languageCode == 'ar') {
      return 'Arabic';
    }
    return 'Unknown';
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations locale = AppLocalizations.of(context)!;
    final languageProvider = context.watch<LanguageProvider>();
    final themeProvider = context.watch<ThemeProvider>();
    final currentLocale = languageProvider.appLocale;

    final List<Locale> supportedLocales = [
      const Locale('en'),
      const Locale('ar'),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          locale.language,
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
          child: DropdownButton(
            borderRadius: BorderRadius.circular(16),
            value: currentLocale,
            onChanged: (Locale? newLocale) {
              if (newLocale != null) {
                languageProvider.toggleLanguage();
              }
            },
            isExpanded: true,
            selectedItemBuilder: (BuildContext context) {
              return supportedLocales.map<Widget>((Locale locale) {
                return Text(
                  _getLanguageDisplayName(context, locale),
                  style: Theme.of(context).textTheme.titleMedium,
                );
              }).toList();
            },
            items: supportedLocales.map<DropdownMenuItem<Locale>>((
              Locale locale,
            ) {
              return DropdownMenuItem<Locale>(
                value: locale,
                child: Text(
                  _getLanguageDisplayName(context, locale),
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
