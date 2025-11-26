import 'package:evently/core/theme/app_colors.dart';
import 'package:evently/ui/events_management/provider/event_management_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class PickLocationScreen extends StatelessWidget {
  final EventManagementProvider provider;
  const PickLocationScreen({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: provider,
      child: Scaffold(
        body: Column(
          children: [
            Consumer<EventManagementProvider>(
              builder: (context, value, child) {
                return Expanded(
                  child: GoogleMap(
                    initialCameraPosition: provider.cameraPosition,
                    onMapCreated: (controller) {
                      provider.mapController = controller;
                    },
                    markers: provider.markers,
                    mapType: MapType.normal,
                    onTap: (location) async {
                      provider.pickLocation(location);
                      await provider.convertLatLng();
                      if (context.mounted) {
                        Navigator.pop(context);
                      }
                    },
                  ),
                );
              },
            ),
            Container(
              padding: EdgeInsets.all(16),
              color: AppColors.blue,
              width: double.infinity,
              child: Text(
                "Tap on location to select",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
