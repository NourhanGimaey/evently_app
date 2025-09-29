import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/core/utils/app_routes.dart';
import 'package:evently/core/widgets/custom_button.dart';
import 'package:evently/core/widgets/custom_textField.dart';
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
                cistomPrefixIcon: Icon(Icons.email),
                customHintText: 'Name',
                customKeyboardType: TextInputType.text,
                customTextInputAction: TextInputAction.next,
              ),
              CustomTextField(
                cistomPrefixIcon: Icon(Icons.lock_open_rounded),
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
              CustomTextField(
                cistomPrefixIcon: Icon(Icons.lock_open_rounded),
                customHintText: 'Re-enter Password',
                customKeyboardType: TextInputType.text,
                customTextInputAction: TextInputAction.next,
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
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium?.copyWith(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
