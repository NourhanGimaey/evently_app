import 'package:evently/core/theme/app_colors.dart';
import 'package:evently/core/widgets/custom_elevated_button.dart';
import 'package:evently/firebase/events_firebase_database.dart';
import 'package:evently/l10n/localization/app_localizations.dart';
import 'package:evently/ui/events_management/models/category_model.dart';
import 'package:evently/ui/events_management/models/event.dart';
import 'package:evently/ui/events_management/provider/event_management_provider.dart';
import 'package:evently/ui/events_management/widgets/custom_text_form_field.dart';
import 'package:evently/ui/events_management/widgets/pick_location_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventManagementScreen extends StatelessWidget {
  const EventManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          locale.createEvent,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new, color: AppColors.blue),
        ),
      ),
      body: Consumer<EventManagementProvider>(
        builder: (context, provider, child) {
          return ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(provider.selectedCategory.imagePath),
              ),
              const SizedBox(height: 16),
              DefaultTabController(
                length: Category.categories.length,
                child: Builder(
                  builder: (BuildContext context) {
                    final TabController tabController = DefaultTabController.of(
                      context,
                    );

                    tabController.addListener(() {
                      if (!tabController.indexIsChanging) {
                        context
                            .read<EventManagementProvider>()
                            .setSelectedCategory(tabController.index);
                      }
                    });

                    return TabBar(
                      isScrollable: true,
                      indicatorWeight: 16,
                      indicatorColor: Colors.transparent,
                      dividerColor: Colors.transparent,
                      tabAlignment: TabAlignment.start,
                      labelPadding: const EdgeInsets.symmetric(horizontal: 10),

                      tabs: Category.categories
                          .map(
                            (e) => Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 16,
                              ),
                              decoration: BoxDecoration(
                                color: provider.selectedCategory.id == e.id
                                    ? AppColors.blue
                                    : Colors.transparent,
                                border: Border.all(color: AppColors.blue),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    e.iconData,
                                    color: provider.selectedCategory.id == e.id
                                        ? AppColors.white
                                        : AppColors.blue,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    e.nameEn,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color:
                                              provider.selectedCategory.id ==
                                                  e.id
                                              ? AppColors.white
                                              : AppColors.blue,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    );
                  },
                ),
              ),
              Text(locale.title),
              const SizedBox(height: 8),
              CustomTextFormField(
                prefixIcon: const Icon(Icons.create),
                hintText: locale.eventTitle,
                controller: provider.titleController,
              ),
              const SizedBox(height: 8),
              Text(locale.description),
              const SizedBox(height: 8),
              CustomTextFormField(
                maxLines: 5,
                hintText: locale.eventDescription,
                controller: provider.descriptionController,
              ),
              Row(
                children: [
                  const Icon(Icons.date_range),
                  const SizedBox(width: 8),
                  Text(locale.eventDate),
                  const Spacer(),
                  TextButton(
                    onPressed: () => provider.selectDate(context),
                    child: Text(
                      provider.getFormattedDate(locale.chooseDate),
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(color: AppColors.blue),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.access_time),
                  const SizedBox(width: 8),
                  Text(locale.eventTime),
                  const Spacer(),
                  TextButton(
                    onPressed: () => provider.selectTime(context),
                    child: Text(
                      provider.getFormattedTime(context, locale.chooseTime),
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(color: AppColors.blue),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(locale.location),
              const SizedBox(height: 8),
              PickLocationButton(provider: provider,),
              const SizedBox(height: 16),
              CustomElevatedButton(
                onPress: () {
                  EventsFirebaseDatabase.createEvent(
                    Event(
                      title: provider.titleController.text,
                      description: provider.descriptionController.text,
                      date: provider.currentDate!.millisecondsSinceEpoch,
                      time: DateTime(
                        0,
                        0,
                        0,
                        provider.currentTime!.hour,
                        provider.currentTime!.minute,
                        0,
                      ).millisecondsSinceEpoch,
                      category: provider.selectedCategory,
                    ),
                  );
                },
                text: locale.addEvent,
                backgroundColor: AppColors.blue,
              ),
            ],
          );
        },
      ),
    );
  }
}
