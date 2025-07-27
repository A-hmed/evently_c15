import 'package:evently_c15/ui/utils/app_assets.dart';
import 'package:flutter/material.dart';

class CategoryDM {
  String name;
  String image;
  IconData iconData;


  CategoryDM({required this.name, required this.image, required this.iconData});

  static List<CategoryDM> homeCategories = [
    CategoryDM(name: "All", image: "", iconData: Icons.all_inbox),
    CategoryDM(name: "Sport", image: AppAssets.eventSport, iconData: Icons.sports_handball),
    CategoryDM(name: "BirthDay", image: AppAssets.eventBirthday, iconData: Icons.cake),
    CategoryDM(name: "Meeting", image: "", iconData: Icons.meeting_room),
    CategoryDM(name: "Gaming", image: AppAssets.eventGaming, iconData: Icons.gamepad),
    CategoryDM(name: "Holiday", image: AppAssets.eventHoliday, iconData: Icons.holiday_village),
    CategoryDM(name: "Booking Club", image: AppAssets.eventBookingClub, iconData: Icons.book_rounded),
  ];

  static CategoryDM fromName(String name){
   return homeCategories.firstWhere((event) => event.name == name);
  }

  static List<CategoryDM> addEventCategories = [
    CategoryDM(name: "Sport", image: AppAssets.eventSport, iconData: Icons.sports_handball),
    CategoryDM(name: "BirthDay", image: AppAssets.eventBirthday, iconData: Icons.cake),
    CategoryDM(name: "Meeting", image: "", iconData: Icons.meeting_room),
    CategoryDM(name: "Gaming", image: AppAssets.eventGaming, iconData: Icons.gamepad),
    CategoryDM(name: "Holiday", image: AppAssets.eventHoliday, iconData: Icons.holiday_village),
    CategoryDM(name: "Booking Club", image: AppAssets.eventBookingClub, iconData: Icons.book_rounded),
  ];

}
