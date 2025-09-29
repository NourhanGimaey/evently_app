import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/core/utils/app_routes.dart';
import 'package:evently/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 16,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.loginScreen.routeName,
                      );
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                  Text(
                    'Forgot Password',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              Expanded(child: Image.asset(AppImages.resetPassword)),
              CustomElevatedButton(onPress: () {}, text: 'Reset Password'),
            ],
          ),
        ),
      ),
    );
  }
}
