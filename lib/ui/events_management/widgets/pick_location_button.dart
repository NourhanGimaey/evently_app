import 'package:evently/core/utils/app_colors.dart';
import 'package:evently/core/utils/app_routes.dart';
import 'package:flutter/material.dart';

class PickLocationButton extends StatelessWidget {
  const PickLocationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: AppColors.blue),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        ),
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.pickLocationScreen.routeName);
        },
        child: Row(
          children: [
            Icon(Icons.gps_fixed, color: AppColors.blue),
            const SizedBox(width: 8),
            Text(
              "Choose Event Location",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.blue,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
