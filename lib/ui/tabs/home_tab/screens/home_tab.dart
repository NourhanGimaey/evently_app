import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/core/utils/app_colors.dart';
import 'package:evently/ui/home/widgets/tab_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:icons_plus/icons_plus.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * .09,
          // automaticallyImplyLeading: false,
          backgroundColor: AppColors.blue,
          foregroundColor: AppColors.white,
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
            indicatorWeight: 16,
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            tabAlignment: TabAlignment.start,
            tabs: [
              CustomTab(customIcon: FontAwesome.compass, tabName: 'All'),
              CustomTab(
                customIcon: FontAwesome.bicycle_solid,
                tabName: 'Sport',
              ),
              CustomTab(
                customIcon: FontAwesome.cake_candles_solid,
                tabName: 'Birthday',
              ),
              CustomTab(customIcon: FontAwesome.calendar, tabName: 'Meeting'),
              CustomTab(
                customIcon: FontAwesome.gamepad_solid,
                tabName: 'Gaming',
              ),
              CustomTab(
                customIcon: FontAwesome.plate_wheat_solid,
                tabName: 'Eating',
              ),
              CustomTab(
                customIcon: FontAwesome.calendar_days,
                tabName: 'Holiday',
              ),
              CustomTab(
                customIcon: FontAwesome.brush_solid,
                tabName: 'Exhibition',
              ),
              CustomTab(
                customIcon: FontAwesome.user_group_solid,
                tabName: 'Wokshop',
              ),
              CustomTab(
                customIcon: FontAwesome.book_bookmark_solid,
                tabName: 'Book Club',
              ),
            ],
          ),
        ),
    );
  }
}