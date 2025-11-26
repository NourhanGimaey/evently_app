import 'dart:developer';
import 'package:evently/firebase/events_firebase_database.dart';
import 'package:evently/ui/tabs/home_tab/provider/home_tab_provider.dart';
import 'package:evently/ui/events_management/widgets/event_card.dart';
import 'package:evently/ui/tabs/home_tab/widget/home_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final double customToolbarHeight = MediaQuery.of(context).size.height * .1;

    return Consumer<HomeTabProvider>(
      builder: (context, homeProvider, child) {
        return Scaffold(
          appBar: HomeAppBar(
            provider: homeProvider,
            customToolbarHeight: customToolbarHeight,
          ),
          body: StreamBuilder(
            stream: EventsFirebaseDatabase.getEventStream(
              homeProvider.currentCategoryId,
            ),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else if (snapshot.hasData) {
                var events =
                    snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
                log(events.toString());
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
        );
      },
    );
  }
}
