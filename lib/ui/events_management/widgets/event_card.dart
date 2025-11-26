import 'package:evently/core/theme/app_colors.dart';
import 'package:evently/firebase/events_firebase_database.dart';
import 'package:evently/ui/auth/provider/firebase_auth_services.dart';
import 'package:evently/ui/events_management/models/category_model.dart';
import 'package:evently/ui/events_management/models/event_model.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final Event event;
  const EventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    var category = Category.categories.firstWhere(
      (e) => e.id == (event.categoryId ?? 0),
    );

    var usedId = FirebaseAuthService.getUserData()!.uid;
    return AspectRatio(
      aspectRatio: 360 / 200,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(category.imagePath)),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      event.title ?? '',
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  IconButton(
                    onPressed: () {
                      EventsFirebaseDatabase.updateFavoriteState(event, usedId);
                    },
                    icon: Icon(
                      (event.favoritesList ?? []).contains(usedId)
                          ? Icons.favorite
                          : Icons.favorite_border,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
