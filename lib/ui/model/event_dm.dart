class EventDM {
  String title;
  String date;
  String image;
  bool isFav;
  double? lat;
  double? lng;
  String? time;
  String description;
  String category;

  EventDM({
    required this.title,
    required this.date,
    required this.image,
    required this.isFav,
    this.lat,
    this.lng,
    this.time,
    required this.description,
    required this.category,
  });
}