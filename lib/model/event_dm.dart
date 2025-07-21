import 'package:evently_c15/model/category_dm.dart';
import 'package:flutter/material.dart';

class EventDM {
  String id;
  String title;
  String categoryId;
  DateTime date;
  String description;
  TimeOfDay time;
  double? lat;
  double? lng;

  EventDM({
    required this.id,
    required this.title,
    required this.categoryId,
    required this.date,
    required this.description,
    required this.time,
    this.lat,
    this.lng,
  });
}
