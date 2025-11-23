import 'package:evently/core/theme/app_colors.dart';
import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/core/utils/app_routes.dart';
import 'package:evently/core/widgets/custom_elevated_button.dart';
import 'package:evently/l10n/localization/app_localizations.dart';
import 'package:evently/ui/onboarding/widgets/language_animated_toggle_switch.dart';
import 'package:evently/ui/onboarding/widgets/theme_animated_toggle_switch.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations locale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(AppImages.logo, width: 160),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(child: Image.asset(AppImages.onboarding)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  locale.personalizeYourExperience,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 16),
                Text(
                  locale.intro,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      locale.language,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    LanguageAnimatedToggleSwitch(),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      locale.theme,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    ThemeAnimatedToggleSwitch(),
                  ],
                ),
                const SizedBox(height: 16),
                SafeArea(
                  child: CustomElevatedButton(
                    backgroundColor: AppColors.blue,
                    text: locale.letsStart,
                    onPress: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.introScreen.routeName,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
