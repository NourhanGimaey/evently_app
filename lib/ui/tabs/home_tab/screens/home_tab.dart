import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/core/utils/app_colors.dart';
import 'package:evently/l10n/localization/app_localizations.dart';
import 'package:evently/ui/tabs/home_tab/provider/home_tab_provider.dart';
import 'package:evently/ui/tabs/home_tab/widget/home_custom_tab_widget.dart';
import 'package:evently/ui/tabs/home_tab/widget/language_icon_button.dart';
import 'package:evently/ui/tabs/home_tab/widget/theme_icon_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations locale = AppLocalizations.of(context)!;
    final user = FirebaseAuth.instance.currentUser;
    final userName = user?.displayName ?? 'Guest';

    return Consumer<HomeTabProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: MediaQuery.of(context).size.height * .1,
            backgroundColor: AppColors.blue,
            foregroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.only(
                bottomStart: Radius.circular(24),
                bottomEnd: Radius.circular(24),
              ),
            ),
            leadingWidth: double.infinity,
            leading: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    locale.welcomeBack,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    userName,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(AppIcons.locationIc),
                      SizedBox(width: 4),
                      Text('Alexandria, Egypt'),
                    ],
                  ),
                ],
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(children: [ThemeIconButton(), LanguageIconButton()]),
              ),
            ],
            bottom: TabBar(
              isScrollable: true,
              onTap: (index) {
                provider.changeHomeTab(index);
              },
              indicatorWeight: 16,
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              tabAlignment: TabAlignment.start,
              labelPadding: EdgeInsets.symmetric(horizontal: 10),
              tabs: [
                HomeCustomTab(
                  index: 0,
                  customIcon: FontAwesome.compass,
                  tabName: locale.all,
                ),
                HomeCustomTab(
                  index: 1,
                  customIcon: Icons.sports_soccer_outlined,
                  tabName: locale.sport,
                ),
                HomeCustomTab(
                  index: 2,
                  customIcon: Icons.cake_outlined,
                  tabName: locale.birthday,
                ),
                HomeCustomTab(
                  index: 3,
                  customIcon: Icons.meeting_room_outlined,
                  tabName: locale.meeting,
                ),
                HomeCustomTab(
                  index: 4,
                  customIcon: Icons.gamepad_outlined,
                  tabName: locale.gaming,
                ),
                HomeCustomTab(
                  index: 5,
                  customIcon: Icons.fastfood_outlined,
                  tabName: locale.eating,
                ),
                HomeCustomTab(
                  index: 6,
                  customIcon: Icons.beach_access_outlined,
                  tabName: locale.holiday,
                ),
                HomeCustomTab(
                  index: 7,
                  customIcon: Icons.art_track_outlined,
                  tabName: locale.exhibition,
                ),
                HomeCustomTab(
                  index: 8,
                  customIcon: Icons.design_services_outlined,
                  tabName: locale.workshop,
                ),
                HomeCustomTab(
                  index: 9,
                  customIcon: Icons.menu_book_outlined,
                  tabName: locale.bookclub,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
