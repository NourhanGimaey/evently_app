import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/core/theme/app_colors.dart';
import 'package:evently/core/utils/app_routes.dart';
import 'package:evently/core/widgets/custom_elevated_button.dart';
import 'package:evently/l10n/localization/app_localizations.dart';
import 'package:evently/ui/auth/provider/firebase_auth_services.dart';
import 'package:evently/ui/auth/widget/custom_text_field.dart';
import 'package:evently/ui/onboarding/widgets/language_animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final authProvider = Provider.of<FirebaseAuthService>(context, listen: false);

    final response = await authProvider.signInEmailPassword(
      _emailController.text.trim(),
      _passwordController.text.trim(),
    );

    if (response.success) {
      if (mounted) {
        Navigator.pushReplacementNamed(
          context,
          AppRoutes.homeScreen.routeName,
        );
      }
    } else {
      String errorMessage;
      switch (response.failure) {
        case AuthFailure.userNotFound:
        errorMessage = 'User not found.';
          break;
        case AuthFailure.invalidCredential: 
          errorMessage = 'Invalid email or password.';
          break;
        case AuthFailure.generalError:
          errorMessage = 'An unexpected error occurred. Please try again.';
          break;
        default:
          errorMessage = 'Login failed.';
          break;
      }
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations locale = AppLocalizations.of(context)!;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.authLogo,
                    height: MediaQuery.of(context).size.height * .2,
                  ),
                  const SizedBox(height: 32),
                  CustomTextField(
                    isEmail: true,
                    controller: _emailController,
                    customLabel: locale.email,
                    customPrefixIcon: const Icon(Icons.email),
                    customKeyboardType: TextInputType.emailAddress,
                    customTextInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    isPassword: true,
                    controller: _passwordController,
                    customLabel: locale.password,
                    customPrefixIcon: const Icon(Icons.lock_open_rounded),
                    customKeyboardType: TextInputType.text,
                    customTextInputAction: TextInputAction.done,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
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
                  ),
                  CustomElevatedButton(
                    onPress: _login,
                    text: locale.login,
                    backgroundColor: AppColors.blue,
                  ),
                  const SizedBox(height: 16),
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
                  const SizedBox(height: 16),
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
                      const Expanded(
                        child: Divider(
                          color: AppColors.blue,
                          thickness: 1,
                          endIndent: 26,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.lightTheme,
                        foregroundColor: AppColors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        side: const BorderSide(color: AppColors.blue),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppImages.googleLogo, width: 26, height: 26),
                          const SizedBox(width: 10),
                          Text(
                            locale.loginWithGoogle,
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
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
