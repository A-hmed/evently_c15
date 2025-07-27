import 'package:firebase_auth/firebase_auth.dart';

class UserDM {
  static UserDM? currentUser;
  static const collectionName = "users";
  late String id;
  late String email;
  late String name;
  late List<String> favoriteEventsIds;

  UserDM(
      {required this.id,
      required this.name,
      required this.email,
      this.favoriteEventsIds = const []});


  UserDM.fromJson(Map<String, dynamic> json){
    id = json['id'];
    email = json['email'];
    name = json['name'];
    List<dynamic> events = json['favoriteEvents'];
    favoriteEventsIds = events.map((id) => id.toString()).toList();
  }

  Map<String, dynamic> toJson(){
    return {
      "id": id,
      "email": email,
      "name": name,
      "favoriteEvents": favoriteEventsIds
    };
  }
}