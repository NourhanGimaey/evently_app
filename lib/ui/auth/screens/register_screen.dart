import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/core/utils/app_colors.dart';
import 'package:evently/core/utils/app_routes.dart';
import 'package:evently/core/widgets/custom_elevated_button.dart';
import 'package:evently/l10n/localization/app_localizations.dart';
import 'package:evently/ui/auth/provider/auth_provider.dart';
import 'package:evently/ui/auth/widget/custom_textField.dart';
import 'package:evently/ui/onboarding/widgets/language_animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleRegister() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error: Passwords do not match.')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);

      await authProvider.register(
        _emailController.text,
        _passwordController.text,
        _nameController.text,
        _phoneController.text,
      );

      // Navigate on success
      if (mounted) {
        Navigator.pushReplacementNamed(
          context,
          AppRoutes.homeScreen.routeName,
        );
      }
    } catch (e) {
      // Show error to user
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString().replaceFirst('Exception: ', ''))),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    AppLocalizations locale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          locale.register,
          style: Theme.of(context).textTheme.titleMedium,
        ),
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
                    isName: true,
                    controller: _nameController,
                    customLabel: locale.name,
                    customPrefixIcon: Icon(Icons.person),
                    customKeyboardType: TextInputType.text,
                    customTextInputAction: TextInputAction.next,
                  ),
                  CustomTextField(
                    isEmail: true,
                    controller: _emailController,
                    customLabel: locale.email,
                    customPrefixIcon: Icon(Icons.email_rounded),
                    customKeyboardType: TextInputType.text,
                    customTextInputAction: TextInputAction.next,
                  ),
                  CustomTextField(
                    isPhone: true,
                    controller: _phoneController,
                    customLabel: locale.phone,
                    customPrefixIcon: Icon(Icons.phone_iphone),
                    customKeyboardType: TextInputType.number,
                    customTextInputAction: TextInputAction.next,
                  ),
                  CustomTextField(
                    isPassword: true,
                    controller: _passwordController,
                    customLabel: locale.password,
                    customPrefixIcon: Icon(Icons.lock_open_rounded),
                    customKeyboardType: TextInputType.text,
                    customTextInputAction: TextInputAction.next,
                  ),
                  CustomTextField(
                    isPassword: true,
                    controller: _confirmPasswordController,
                    customLabel: locale.reEnterPassword,
                    customPrefixIcon: Icon(Icons.lock_open_rounded),
                    customKeyboardType: TextInputType.text,
                    customTextInputAction: TextInputAction.done,
                  ),
                  CustomElevatedButton(
                     onPress: _isLoading ? () {} : _handleRegister,
                    text: _isLoading
                        ? '...' // Use a simple loading indicator text
                        : locale.createAccount,
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
