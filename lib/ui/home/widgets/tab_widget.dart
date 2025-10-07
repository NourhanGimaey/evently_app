import 'package:evently/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  final String tabName;
  final IconData customIcon;
  const CustomTab({super.key, required this.tabName, required this.customIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(46),
        color: AppColors.blue,
        border: Border.all(color: AppColors.white, width: 1),
      ),
      height: 40,
      child: Row(
        children: [
          Icon(customIcon, color: AppColors.white),
          SizedBox(width: 8),
          Text(
            tabName,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
