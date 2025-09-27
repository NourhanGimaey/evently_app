import 'package:evently/core/utils/app_colors.dart';
import 'package:evently/screens/intro.dart';
import 'package:evently/screens/onboarding.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Evently App',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.lightTheme,
        textTheme: TextTheme(
          titleMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.blue,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(AppColors.blue),
            foregroundColor: WidgetStatePropertyAll(AppColors.white),
            fixedSize: WidgetStatePropertyAll(Size.fromHeight(56)),
            shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(16),
              ),
            ),
          ),
        ),
      ),
      initialRoute: OnboardingScreen.routeName,
      routes: {
        OnboardingScreen.routeName: (context) => OnboardingScreen(),
        IntroScreen.routeName: (context) => IntroScreen(),
      },
    );
  }
}
