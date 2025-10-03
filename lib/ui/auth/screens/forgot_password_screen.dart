import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/core/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Forgot Password',
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
              CustomElevatedButton(onPress: () {}, text: 'Reset Password'),
            ],
          ),
        ),
      ),
    );
  }
}
