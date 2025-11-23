import 'package:evently/core/theme/app_colors.dart';
import 'package:evently/core/utils/app_routes.dart';
import 'package:evently/l10n/localization/app_localizations.dart';
import 'package:evently/ui/events_management/provider/event_management_provider.dart';
import 'package:flutter/material.dart';

class PickLocationButton extends StatelessWidget {
  final EventManagementProvider provider;
  const PickLocationButton({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;

    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: AppColors.blue),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
      onPressed: () {
        Navigator.pushNamed(
          context,
          AppRoutes.pickLocationScreen.routeName,
          arguments: provider,
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.gps_fixed, color: AppColors.white),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    provider.eventLocation == null
                        ? locale.chooseEventLocation
                        : '${provider.eventLocation?.latitude ?? 0}, ${provider.eventLocation?.longitude ?? 0}',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.blue,
                      fontWeight: FontWeight.w500,
                    ),
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios_rounded, color: AppColors.blue),
        ],
      ),
    );
  }
}
