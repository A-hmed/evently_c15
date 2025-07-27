import 'package:cloud_firestore/cloud_firestore.dart';

class EventDM {
  static const String collectionName = "events";
  late String id;
  late String title;
  late DateTime date;
  late double? lat;
  late double? lng;
  late String description;
  late String category;
  late String ownerId;

  EventDM({
    required this.title,
    required this.date,
    required this.id,
    required this.ownerId,
    this.lat,
    this.lng,
    required this.description,
    required this.category,
  });

  EventDM.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    title = json['title'] as String;
    var timeStamp = json['date'] as Timestamp;
    date = timeStamp.toDate();
    lat = (json['lat'] as num?)?.toDouble();
    lng = (json['lng'] as num?)?.toDouble();
    description = json['description'] as String;
    category = json['category'] as String;
    ownerId = json['ownerId'] as String;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'date': date,
      'lat': lat,
      'lng': lng,
      'description': description,
      'category': category,
      'ownerId': ownerId,
    };
  }
}