import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/core/utils/app_colors.dart';
import 'package:evently/ui/home/provider/main_layout_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class MainLayoutBottomAppbar extends StatelessWidget {
  const MainLayoutBottomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MainLayoutProvider>(
      builder: (context, provider, child) {
        return BottomAppBar(
          padding: EdgeInsets.zero,
          color: AppColors.blue,
          notchMargin: 5,
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      provider.changeTab(0);
                    },
                    icon: SvgPicture.asset(
                      provider.currentIndex == 0
                          ? AppIcons.homeFilledIc
                          : AppIcons.homeIc,
                    ),
                  ),
                  Text('Home', style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      provider.changeTab(1);
                    },
                    icon: SvgPicture.asset(
                      provider.currentIndex == 1
                          ? AppIcons.locationFilledIc
                          : AppIcons.locationIc,
                    ),
                  ),
                  Text('Map', style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      provider.changeTab(2);
                    },
                    icon: Icon(
                      provider.currentIndex == 2
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    'Favorite',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      provider.changeTab(3);
                    },
                    icon: SvgPicture.asset(
                      provider.currentIndex == 3
                          ? AppIcons.profileFilledIc
                          : AppIcons.profileIc,
                    ),
                  ),
                  Text('Profile', style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
