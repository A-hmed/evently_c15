import 'package:flutter/material.dart';

class CategoryDM {
  String name;
  String image;
  IconData iconData;


  CategoryDM({required this.name, required this.image, required this.iconData});

  static List<CategoryDM> homeCategories = [
    CategoryDM(name: "All", image: "", iconData: Icons.all_inbox),
    CategoryDM(name: "Sport", image: "", iconData: Icons.sports_handball),
    CategoryDM(name: "BirthDay", image: "", iconData: Icons.cake),
    CategoryDM(name: "Meeting", image: "", iconData: Icons.meeting_room),
    CategoryDM(name: "Gaming", image: "", iconData: Icons.gamepad),
    CategoryDM(name: "Holiday", image: "", iconData: Icons.holiday_village),
    CategoryDM(name: "Booking Club", image: "", iconData: Icons.book_rounded),
  ];

  static List<CategoryDM> addEventCategories = [
    CategoryDM(name: "Sport", image: "", iconData: Icons.sports_handball),
    CategoryDM(name: "BirthDay", image: "", iconData: Icons.cake),
    CategoryDM(name: "Meeting", image: "", iconData: Icons.meeting_room),
    CategoryDM(name: "Gaming", image: "", iconData: Icons.gamepad),
    CategoryDM(name: "Holiday", image: "", iconData: Icons.holiday_village),
    CategoryDM(name: "Booking Club", image: "", iconData: Icons.book_rounded),
  ];

}
