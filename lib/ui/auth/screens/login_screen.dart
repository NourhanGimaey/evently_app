import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/core/utils/app_colors.dart';
import 'package:evently/core/utils/app_routes.dart';
import 'package:evently/core/widgets/custom_elevated_button.dart';
import 'package:evently/l10n/localization/app_localizations.dart';
import 'package:evently/ui/auth/widget/custom_textField.dart';
import 'package:evently/ui/onboarding/widgets/language_animated_toggle_switch.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations locale = AppLocalizations.of(context)!;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 16,
            children: [
              Image.asset(
                AppImages.authLogo,
                height: MediaQuery.of(context).size.height * .2,
              ),
              CustomTextField(
                customLabel: locale.email,
                customPrefixIcon: Icon(Icons.email),
                customKeyboardType: TextInputType.text,
                customTextInputAction: TextInputAction.next,
              ),
              CustomTextField(
                customLabel: locale.password,
                isPassword: true,
                customPrefixIcon: Icon(Icons.lock_open_rounded),
                customKeyboardType: TextInputType.text,
                customTextInputAction: TextInputAction.next,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.forgotPassword.routeName,
                  );
                },
                child: Text(
                  locale.forgotPassword,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.blue,
                  ),
                ),
              ),
              CustomElevatedButton(
                onPress: () {
                  Navigator.pushReplacementNamed(
                    context,
                    AppRoutes.homeScreen.routeName,
                  );
                },
                text: locale.login,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(locale.dontHaveaccount),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.registerScreen.routeName,
                      );
                    },
                    child: Text(
                      locale.createAccount,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: AppColors.blue,
                      thickness: 1,
                      indent: 26,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      locale.or,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(color: AppColors.blue),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: AppColors.blue,
                      thickness: 1,
                      endIndent: 26,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.lightTheme,
                    foregroundColor: AppColors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(16),
                    ),
                    side: const BorderSide(color: AppColors.blue),
                  ),
                  onPressed: () {},
                  child: Row(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.googleLogo, width: 26, height: 26),
                      Text(
                        locale.loginWithGoogle,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              LanguageAnimatedToggleSwitch(),
            ],
          ),
        ),
      ),
    );
  }
}
