import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/core/utils/app_routes.dart';
import 'package:evently/core/utils/app_text.dart';
import 'package:evently/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Image.asset(AppImages.logo, width: 160)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Image.asset(AppImages.onboarding)),
            Text(
              AppText.onboardingTitle,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            Text(
              AppText.onboarding,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  AppText.language,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  AppText.theme,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 8),
            SafeArea(
              child: CustomElevatedButton(
                text: AppText.start,
                onPress: () {
                  Navigator.pushNamed(context, AppRoutes.introScreen.routeName);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
