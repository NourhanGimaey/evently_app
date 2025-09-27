import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/core/utils/app_colors.dart';
import 'package:evently/core/utils/app_text.dart';
import 'package:evently/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  static const String routeName = '/';
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightTheme,
        title: Image.asset(AppImages.logo, width: 160),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            Image.asset(AppImages.onboarding),
            Text(
              AppText.onboardingTitle,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              AppText.onboarding,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            ListTile(
              leading: Text(
                AppText.language,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            ListTile(
              leading: Text(
                AppText.theme,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: CustomElevatedButton(text: AppText.start),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
