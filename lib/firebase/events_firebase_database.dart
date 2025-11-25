import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/ui/events_management/models/event.dart';

class EventsFirebaseDatabase {
  static FirebaseFirestore db = FirebaseFirestore.instance;

  static CollectionReference<Event> getCollectionReference() {
    return db
        .collection("Events")
        .withConverter<Event>(
          fromFirestore: (snapshot, _) => Event.fromFirestore(snapshot.data()!),
          toFirestore: (event, _) => event.toFirestore(),
        );
  }

  static Future<void> createEvent(Event event) async {
    try {
      CollectionReference<Event> ref = getCollectionReference();
      DocumentReference<Event> doc = ref.doc();
      event.id = doc.id;
      await doc.set(event);
    } catch (e) {
      rethrow;
    }
  }

}
