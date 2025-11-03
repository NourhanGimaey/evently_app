import 'package:evently/ui/events_management/provider/event_management_provider.dart';
import 'package:flutter/material.dart';

class PickLocationScreen extends StatelessWidget {
  final EventManagementProvider provider;
  const PickLocationScreen({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [
          Text("data")
        ],
      ));
  }
}
