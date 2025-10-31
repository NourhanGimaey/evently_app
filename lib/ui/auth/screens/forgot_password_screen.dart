import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/core/utils/app_colors.dart';
import 'package:evently/core/widgets/custom_elevated_button.dart';
import 'package:evently/l10n/localization/app_localizations.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations locale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          locale.forgetPassword,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 16,
            children: [
              Expanded(child: Image.asset(AppImages.resetPassword)),
              CustomElevatedButton(
                onPress: () {}, 
                backgroundColor: AppColors.blue,text: locale.resetPassword),
            ],
          ),
        ),
      ),
    );
  }
}
