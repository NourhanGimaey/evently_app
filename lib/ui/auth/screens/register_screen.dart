import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/core/utils/app_colors.dart';
import 'package:evently/core/utils/app_routes.dart';
import 'package:evently/core/widgets/custom_button.dart';
import 'package:evently/core/widgets/custom_textField.dart';
import 'package:evently/core/widgets/toggle_theme.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register', style: Theme.of(context).textTheme.titleMedium),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
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
                customPrefixIcon: Icon(Icons.person),
                customKeyboardType: TextInputType.text,
                customTextInputAction: TextInputAction.next,
              ),
              CustomTextField(
                customLabel: 'Email',
                customPrefixIcon: Icon(Icons.email_rounded),
                customKeyboardType: TextInputType.text,
                customTextInputAction: TextInputAction.next,
              ),
              CustomTextField(
                customLabel: 'Phone',
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
              CustomElevatedButton(onPress: () {}, text: 'Create Account'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.loginScreen.routeName,
                      );
                    },
                    child: Text(
                      'Login',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              CustomToggleTheme(),
            ],
          ),
        ),
      ),
    );
  }
}
