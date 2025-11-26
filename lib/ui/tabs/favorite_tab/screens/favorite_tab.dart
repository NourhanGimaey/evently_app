import 'package:evently/core/theme/app_colors.dart';
import 'package:evently/firebase/events_firebase_database.dart';
import 'package:evently/ui/auth/provider/firebase_auth_services.dart';
import 'package:evently/ui/events_management/widgets/event_card.dart';
import 'package:flutter/material.dart';

class FavoriteTab extends StatelessWidget {
  const FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    var userId = FirebaseAuthService.getUserData()?.uid ?? '';
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: AppColors.blue),
                hintText: 'Search for Event',
                hintStyle: TextStyle(
                  color: AppColors.blue,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 18.0,
                  horizontal: 10.0,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: AppColors.blue, width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: AppColors.blue, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: AppColors.blue, width: 2.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream: EventsFirebaseDatabase.getUserFavoritesList(userId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else if (snapshot.hasData) {
                  var events =
                      snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
                  return ListView.separated(
                    padding: EdgeInsets.all(16),
                    itemBuilder: (context, index) =>
                        EventCard(event: events[index]),
                    separatorBuilder: (conetext, index) => SizedBox(height: 16),
                    itemCount: events.length,
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
