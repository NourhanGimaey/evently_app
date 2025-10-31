import 'package:evently/l10n/localization/app_localizations.dart';
import 'package:flutter/material.dart';

class IntroDetails {
  final String imagePath;
  final String titleKey;
  final String subtitleKey;

  const IntroDetails({
    required this.imagePath,
    required this.titleKey,
    required this.subtitleKey,
  });

  static const List<IntroDetails> introDetails = [
    IntroDetails(
      imagePath: 'assets/images/intro1.png',
      titleKey: 'intro1Title',
      subtitleKey: 'intro1Subtitle',
    ),
    IntroDetails(
      imagePath: 'assets/images/intro2.png',
      titleKey: 'intro2Title',
      subtitleKey: 'intro2Subtitle',
    ),
    IntroDetails(
      imagePath: 'assets/images/intro3.png',
      titleKey: 'intro3Title',
      subtitleKey: 'intro3Subtitle',
    ),
  ];

  String getLocalizedTitle(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    
    switch (titleKey) {
      case 'intro1Title':
        return localizations.intro1Title;
      case 'intro2Title':
        return localizations.intro2Title;
      case 'intro3Title':
        return localizations.intro3Title;
      default:
        return titleKey;
    }
  }

  String getLocalizedSubtitle(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    switch (subtitleKey) {
      case 'intro1Subtitle':
        return localizations.intro1Subtitle;
      case 'intro2Subtitle':
        return localizations.intro2Subtitle;
      case 'intro3Subtitle':
        return localizations.intro3Subtitle;
      default:
        return subtitleKey;
    }
  }
}