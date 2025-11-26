import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/ui/events_management/models/event_model.dart';

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

  static Stream<QuerySnapshot<Event>> getEventStream(int categoryId) {
    var ref = getCollectionReference();
    if (categoryId == 0) {
      return ref.snapshots();
    }
    return ref.where("categoryId", isEqualTo: categoryId).snapshots();
  }

  static Future<void> updateFavoriteState(Event event, String userId) async {
    if ((event.favoritesList ?? []).contains(userId)) {
      event.favoritesList?.removeWhere((e) => e == userId);
    } else {
      event.favoritesList = event.favoritesList ?? [];
      event.favoritesList?.add(userId);
    }

    var doc = getCollectionReference().doc(event.id);
    await doc.update(event.toFirestore());
  }

  static Stream<QuerySnapshot<Event>> getUserFavoritesList(String userId) {
    return getCollectionReference()
        .where('favoritesList', arrayContains: userId)
        .snapshots();
  }
}
