import 'package:evently/core/utils/app_colors.dart';
import 'package:evently/ui/onboarding/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageToggleButton extends StatelessWidget {
  const LanguageToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = context.watch<LanguageProvider>();
    final isEnglish = languageProvider.appLocale.languageCode == 'en';

    final displayCode = isEnglish ? 'EN' : 'AR';

    return InkWell(
      onTap: () {
        languageProvider.toggleLanguage();
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.white,
          border: Border.all(color: AppColors.blue, width: 1),
        ),
        width: 35,
        height: 33,
        child: Text(
          displayCode,
          style: TextStyle(
            color: AppColors.blue,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
