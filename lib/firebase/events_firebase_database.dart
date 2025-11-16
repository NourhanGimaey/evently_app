import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/ui/events_management/models/event.dart';

class EventsFirebaseDatabase {
 static var db = FirebaseFirestore.instance;

static CollectionReference<Event> getCollectionReference (){
  return db.collection("Events").withConverter<Event>(
    fromFirestore: (snapshot, _) => Event.fromFirestore(snapshot.data()!),
    toFirestore: (event, _) => event.toJcon(),
  );
}

static Future<void> createEvent(Event event) async{
try{
  var doc = await getCollectionReference().doc();
  event.id = doc.id;
  await doc.set(event);
} catch (e){
  rethrow;
 }
}

}