import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/core/utils/app_colors.dart';
import 'package:evently/core/utils/app_routes.dart';
import 'package:evently/core/widgets/custom_elevated_button.dart';
import 'package:evently/l10n/localization/app_localizations.dart';
import 'package:evently/ui/auth/provider/firebase_auth_services.dart';
import 'package:evently/ui/tabs/profile_tab/widget/custom_language_dropdown.dart';
import 'package:evently/ui/tabs/profile_tab/widget/custom_theme_dropdown.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations locale = AppLocalizations.of(context)!;
    final user = FirebaseAuth.instance.currentUser;
    final userName = user?.displayName ?? 'Guest';
    final userEmail = user?.email ?? '';
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * .15,
        backgroundColor: AppColors.blue,
        foregroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
            bottomStart: Radius.circular(64),
          ),
        ),
        leadingWidth: double.infinity,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage(AppImages.routePP)),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    userName,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 10),
                  Text(
                    userEmail,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomLanguageDropdown(),
            SizedBox(height: 16),
            CustomThemeDropdown(),
            Spacer(),
            CustomElevatedButton(
              onPress: () async {
                await FirebaseAuthService().signOut();
                if (context.mounted) {
                  Navigator.of(
                    context,
                  ).pushReplacementNamed(AppRoutes.loginScreen.routeName);
                }
              },
              backgroundColor: Colors.red,
              text: locale.logout,
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
