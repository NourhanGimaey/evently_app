import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/core/utils/app_routes.dart';
import 'package:evently/core/widgets/custom_button.dart';
import 'package:evently/core/widgets/custom_textField.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                cistomPrefixIcon: Icon(Icons.email),
                customHintText: 'Email',
                customKeyboardType: TextInputType.text,
                customTextInputAction: TextInputAction.next,
              ),
              CustomTextField(
                cistomPrefixIcon: Icon(Icons.lock_open_rounded),
                customHintText: 'Password',
                customKeyboardType: TextInputType.text,
                customTextInputAction: TextInputAction.next,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.forgotPassword.routeName);
                },
                child: Text(
                  'Forgot Passwrod?',
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(fontSize: 16),
                ),
              ),
              CustomElevatedButton(onPress: () {}, text: 'Login'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.registerScreen.routeName);
                    },
                    child: Text(
                      'Create account',
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium?.copyWith(fontSize: 16),
                    ),
                  ),
                ],
              ),
              CustomElevatedButton(onPress: () {}, text: 'Login with Google'),
            ],
          ),
        ),
      ),
    );
  }
}
