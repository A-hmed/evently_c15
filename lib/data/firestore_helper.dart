import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_c15/ui/model/event_dm.dart';
import 'package:evently_c15/ui/model/user_dm.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> addUserToFirestore(UserDM user) async {
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection(UserDM.collectionName);
  var emptyDoc = userCollection.doc(user.id);
  return emptyDoc.set(user.toJson());
}

Future<UserDM> getUserFromFirestore(String id) async {
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection(UserDM.collectionName);
  DocumentReference userDoc = userCollection.doc(id);
  var snapshot = await userDoc.get();
  var json = snapshot.data() as Map<String, dynamic>;
  var user = UserDM.fromJson(json);
  return user;
}

//
Stream<List<EventDM>> getAllEventsFromFirestore() {
  var eventsCollection =
      FirebaseFirestore.instance.collection(EventDM.collectionName);
  var querySnapshotStream = eventsCollection.snapshots();
  return querySnapshotStream.map((querySnapshot) {
   return querySnapshot.docs.map((querySnapshot) {
      var json = querySnapshot.data();
      return EventDM.fromJson(json);
    }).toList();
  });
}

//
Future<List<EventDM>> getFavoriteEventsFromFirestore() async {
  var eventsCollection =
      FirebaseFirestore.instance.collection(EventDM.collectionName);

  var querySnapshot = await eventsCollection
      .where("id", whereIn: UserDM.currentUser!.favoriteEventsIds)
      .get();

  return querySnapshot.docs.map((querySnapshot) {
    var json = querySnapshot.data();
    return EventDM.fromJson(json);
  }).toList();
}

//
Future<void> addEventToFirestore(EventDM event) async {
  var eventsCollection =
      FirebaseFirestore.instance.collection(EventDM.collectionName);
  var emptyDoc = eventsCollection.doc();
  event.id = emptyDoc.id;
  emptyDoc.set(event.toJson());
  // var doc = await eventsCollection.add(event.toJson());
  // doc.update({
  //   "id": doc.id
  // });
}
//

Future<void> addEventToFavorite(String eventId) async {
  var userCollection =
      FirebaseFirestore.instance.collection(UserDM.collectionName);
  var doc = userCollection.doc(UserDM.currentUser!.id);
  doc.update({
    "favoriteEvents": FieldValue.arrayUnion([eventId])
  });
  UserDM.currentUser!.favoriteEventsIds.add(eventId);
}

Future<void> removeEventFromFavorite(String eventId) async {
  var userCollection =
      FirebaseFirestore.instance.collection(UserDM.collectionName);
  var doc = userCollection.doc(UserDM.currentUser!.id);
  doc.update({
    "favoriteEvents": FieldValue.arrayRemove([eventId])
  });
  UserDM.currentUser!.favoriteEventsIds.remove(eventId);
}
