import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/core/utils/app_colors.dart';
import 'package:evently/core/utils/app_routes.dart';
import 'package:evently/core/widgets/custom_elevated_button.dart';
import 'package:evently/ui/auth/widget/custom_textField.dart';
import 'package:evently/ui/onboarding/widgets/toggle_switch.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register', style: Theme.of(context).textTheme.titleMedium),
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
                    customLabel: 'Name',
                    isName: true,
                    customPrefixIcon: Icon(Icons.person),
                    customKeyboardType: TextInputType.text,
                    customTextInputAction: TextInputAction.next,
                  ),
                  CustomTextField(
                    customLabel: 'Email',
                    isEmail: true,
                    customPrefixIcon: Icon(Icons.email_rounded),
                    customKeyboardType: TextInputType.text,
                    customTextInputAction: TextInputAction.next,
                  ),
                  CustomTextField(
                    customLabel: 'Phone',
                    isPhone: true,
                    customPrefixIcon: Icon(Icons.phone_iphone),
                    customKeyboardType: TextInputType.number,
                    customTextInputAction: TextInputAction.next,
                  ),
                  CustomTextField(
                    customLabel: 'Password',
                    isPassword: true,
                    customPrefixIcon: Icon(Icons.lock_open_rounded),
                    customKeyboardType: TextInputType.text,
                    customTextInputAction: TextInputAction.next,
                  ),
                  CustomTextField(
                    customLabel: 'Re-enter Password',
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
                    text: 'Create Account',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            AppRoutes.loginScreen.routeName,
                          );
                        },
                        child: Text(
                          'Login',
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
                  CustomToggleSwitch(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
