import 'package:evently/ui/auth/provider/firebase_auth_services.dart';
import 'package:evently/ui/auth/screens/forgot_password_screen.dart';
import 'package:evently/ui/auth/screens/login_screen.dart';
import 'package:evently/ui/auth/screens/register_screen.dart';
import 'package:evently/ui/events_management/provider/event_management_provider.dart';
import 'package:evently/ui/events_management/screens/event_management_screen.dart';
import 'package:evently/ui/events_management/screens/pick_location_screen.dart';
import 'package:evently/ui/home/provider/main_layout_provider.dart';
import 'package:evently/ui/home/screens/main_layout.dart';
import 'package:evently/ui/onboarding/screens/intro_screen.dart';
import 'package:evently/ui/onboarding/screens/onboarding_screen.dart';
import 'package:evently/ui/tabs/home_tab/provider/home_tab_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum AppRoutes {
  onboardingScreen('/'),
  introScreen('/intro_screen'),
  loginScreen('/login_screen'),
  registerScreen('/register_screen'),
  forgotPassword('/forgot_password_screen'),
  homeScreen('/home_screen'),
  mainLayout('/main_layout'),
  eventManagementScreen('/event_management_screen'),
  pickLocationScreen('/pick_location_screen');

  final String routeName;
  const AppRoutes(this.routeName);

  static Map<String, Widget Function(BuildContext)> routes = {
    AppRoutes.onboardingScreen.routeName: (context) => const OnboardingScreen(),
    AppRoutes.introScreen.routeName: (context) => const IntroScreen(),
    AppRoutes.loginScreen.routeName: (context) => ChangeNotifierProvider(
      create: (context) => FirebaseAuthService(),
      child: const LoginScreen(),
    ),
    AppRoutes.registerScreen.routeName: (context) => ChangeNotifierProvider(
      create: (context) => FirebaseAuthService(),
      child: const RegisterScreen(),
    ),
    AppRoutes.forgotPassword.routeName: (context) => const ForgotPassword(),
    AppRoutes.homeScreen.routeName: (context) => MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MainLayoutProvider()),
        ChangeNotifierProvider(create: (context) => HomeTabProvider()),
      ],
      child: const MainLayout(),
    ),
    AppRoutes.eventManagementScreen.routeName: (context) =>
        ChangeNotifierProvider(
          create: (context) => EventManagementProvider(),
          child: const EventManagementScreen(),
        ),

    AppRoutes.pickLocationScreen.routeName: (context) {
      EventManagementProvider provider =
          ModalRoute.of(context)?.settings.arguments as EventManagementProvider;
      return PickLocationScreen(provider: provider);
    },
  };
}
