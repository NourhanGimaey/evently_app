import 'package:evently/ui/tabs/maps_tab/provider/map_tab_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapTab extends StatelessWidget {
  const MapTab({super.key});

  @override
  Widget build(BuildContext context) {
    MapTabProvider provider = Provider.of<MapTabProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              initialCameraPosition: provider.cameraPosition,
              onMapCreated: (controller) {
                provider.mapController = controller;
              },
              mapType: MapType.normal,
              markers: provider.markers,
            ),
          ),
        ],
      ),
    );
  }
}
