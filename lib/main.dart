import 'package:evently/core/utils/app_routes.dart';
import 'package:evently/core/utils/app_theme.dart';
import 'package:evently/ui/auth/screens/forgot_password_screen.dart';
import 'package:evently/ui/onboarding/screens/intro_screen.dart';
import 'package:evently/ui/auth/screens/login_screen.dart';
import 'package:evently/ui/onboarding/screens/onboarding_screen.dart';
import 'package:evently/ui/auth/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('en'), Locale('ar')],
      locale: Locale('en'),

      theme: lightTheme,
      initialRoute: AppRoutes.onboardingScreen.routeName,
      routes: {
        AppRoutes.onboardingScreen.routeName: (context) => OnboardingScreen(),
        AppRoutes.introScreen.routeName: (context) => IntroScreen(),
        AppRoutes.loginScreen.routeName: (context) => LoginScreen(),
        AppRoutes.registerScreen.routeName: (context) => RegisterScreen(),
        AppRoutes.forgotPassword.routeName: (context) => ForgotPassword(),
      },
    );
  }
}
