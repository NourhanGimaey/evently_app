import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/core/utils/app_colors.dart';
import 'package:evently/core/utils/app_routes.dart';
import 'package:evently/core/widgets/custom_elevated_button.dart';
import 'package:evently/l10n/localization/app_localizations.dart';
import 'package:evently/ui/auth/widget/custom_textField.dart';
import 'package:evently/ui/onboarding/widgets/language_animated_toggle_switch.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations locale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(locale.register, style: Theme.of(context).textTheme.titleMedium),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SafeArea(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 16,
                children: [
                  Image.asset(
                    AppImages.authLogo,
                    height: MediaQuery.of(context).size.height * .2,
                  ),
                  CustomTextField(
                    customLabel: locale.name,
                    isName: true,
                    customPrefixIcon: Icon(Icons.person),
                    customKeyboardType: TextInputType.text,
                    customTextInputAction: TextInputAction.next,
                  ),
                  CustomTextField(
                    customLabel: locale.email,
                    isEmail: true,
                    customPrefixIcon: Icon(Icons.email_rounded),
                    customKeyboardType: TextInputType.text,
                    customTextInputAction: TextInputAction.next,
                  ),
                  CustomTextField(
                    customLabel: locale.phone,
                    isPhone: true,
                    customPrefixIcon: Icon(Icons.phone_iphone),
                    customKeyboardType: TextInputType.number,
                    customTextInputAction: TextInputAction.next,
                  ),
                  CustomTextField(
                    customLabel: locale.password,
                    isPassword: true,
                    customPrefixIcon: Icon(Icons.lock_open_rounded),
                    customKeyboardType: TextInputType.text,
                    customTextInputAction: TextInputAction.next,
                  ),
                  CustomTextField(
                    customLabel: locale.reEnterPassword,
                    isPassword: true,
                    customPrefixIcon: Icon(Icons.lock_open_rounded),
                    customKeyboardType: TextInputType.text,
                    customTextInputAction: TextInputAction.done,
                  ),
                  CustomElevatedButton(
                    onPress: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.homeScreen.routeName,
                        );
                      }
                    },
                    text: locale.createAccount,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(locale.alreadyHaveAccount),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            AppRoutes.loginScreen.routeName,
                          );
                        },
                        child: Text(
                          locale.login,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.blue,
                              ),
                        ),
                      ),
                    ],
                  ),
                  LanguageAnimatedToggleSwitch(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
