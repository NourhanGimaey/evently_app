import 'package:evently/core/utils/app_routes.dart';
import 'package:evently/core/theme/app_theme.dart';
import 'package:evently/firebase/firebase_options.dart';
import 'package:evently/l10n/localization/app_localizations.dart';
import 'package:evently/ui/onboarding/provider/language_provider.dart';
import 'package:evently/ui/onboarding/provider/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = context.watch<LanguageProvider>();
    final themeProvider = context.watch<ThemeProvider>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Evently App',
      themeMode: themeProvider.themeMode,
      theme: appLightTheme,
      darkTheme: appDarkTheme,  

      locale: languageProvider.appLocale,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('en'), Locale('ar')],

      initialRoute: AppRoutes.onboardingScreen.routeName,
      routes: AppRoutes.routes,
    );
  }
}
