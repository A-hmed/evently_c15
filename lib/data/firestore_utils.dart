import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_c15/model/event_dm.dart';

// void addUserToFirestore(UserDM user) {}
//
// UserDM getFromUserFirestore(String userId) {}
//
Future<void> addEventToFirestore(EventDM event) async {
  ///Create new collection
 var eventsCollection =  FirebaseFirestore.instance.collection("events");

 eventsCollection.add({
   "title": event.title,
   "description": event.description,
   "date": event.date,
   //"time": event.time,
   "category": event.categoryId,
 });
}
//
// List<EventDM> getAllEventsFromFirestore() {}
//
// List<EventDM> getFavoriteEventsFromFirestore() {}
