import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/core/utils/app_colors.dart';
import 'package:evently/l10n/localization/app_localizations.dart';
import 'package:evently/ui/tabs/home_tab/provider/home_tab_provider.dart';
import 'package:evently/ui/tabs/home_tab/widget/home_custom_tab_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations locale = AppLocalizations.of(context)!;

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
                    'Welcome Back ✨',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    'User Name',
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
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.light_mode_outlined,
                        color: AppColors.white,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.white,
                      ),
                      width: 35,
                      height: 33,
                      child: Text(
                        'EN',
                        style: TextStyle(
                          color: AppColors.blue,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
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
                  tabName: 'All',
                ),
                HomeCustomTab(
                  index: 1,
                  customIcon: FontAwesome.bicycle_solid,
                  tabName: 'Sport',
                ),
                HomeCustomTab(
                  index: 2,
                  customIcon: FontAwesome.cake_candles_solid,
                  tabName: 'Birthday',
                ),
                HomeCustomTab(
                  index: 3,
                  customIcon: FontAwesome.calendar,
                  tabName: 'Meeting',
                ),
                HomeCustomTab(
                  index: 4,
                  customIcon: FontAwesome.gamepad_solid,
                  tabName: 'Gaming',
                ),
                HomeCustomTab(
                  index: 5,
                  customIcon: FontAwesome.plate_wheat_solid,
                  tabName: 'Eating',
                ),
                HomeCustomTab(
                  index: 6,
                  customIcon: FontAwesome.calendar_days,
                  tabName: 'Holiday',
                ),
                HomeCustomTab(
                  index: 7,
                  customIcon: FontAwesome.brush_solid,
                  tabName: 'Exhibition',
                ),
                HomeCustomTab(
                  index: 8,
                  customIcon: FontAwesome.user_group_solid,
                  tabName: 'Wokshop',
                ),
                HomeCustomTab(
                  index: 9,
                  customIcon: FontAwesome.book_bookmark_solid,
                  tabName: 'Book Club',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
