enum AppRoutes {
  onboardingScreen('/'),
  introScreen('/intro_screen'),
  loginScreen('/login_screen'),
  registerScreen('/register_screen'),
  forgotPassword('/forgot_password_screen'),
  homeScreen('/home_screen');

final String routeName;
  const AppRoutes(this.routeName);
}
