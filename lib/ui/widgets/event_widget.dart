import 'package:evently_c15/data/firestore_helper.dart';
import 'package:evently_c15/ui/model/category_dm.dart';
import 'package:evently_c15/ui/model/event_dm.dart';
import 'package:evently_c15/ui/model/user_dm.dart';
import 'package:evently_c15/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class EventWidget extends StatefulWidget {
  final EventDM event;
  final Function? onFavClick;

  const EventWidget({super.key, required this.event, this.onFavClick});

  @override
  State<EventWidget> createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  @override
  Widget build(BuildContext context) {
    CategoryDM categoryDM = CategoryDM.fromName(widget.event.category);
    return Container(
      height: MediaQuery.of(context).size.height * .25,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(image: AssetImage(categoryDM.image)),
          borderRadius: BorderRadius.circular(16)),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [buildDate(), Spacer(), buildEventInfo()]),
    );
  }

  buildDate() => Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Text(
              widget.event.date.day.toString(),
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.blue),
            ),
            Text(
              getMonthAbbreviation(widget.event.date.month),
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.blue),
            ),
          ],
        ),
      );

  String getMonthAbbreviation(int month) {
    const months = [
      'jan',
      'feb',
      'mar',
      'apr',
      'may',
      'jun',
      'jul',
      'aug',
      'sep',
      'oct',
      'nov',
      'dec'
    ];
    return months[month - 1];
  }

  buildEventInfo() => Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            Expanded(child: Text(widget.event.title)),
            buildFavIcon(),
          ],
        ),
      );

  Widget buildFavIcon() {
    bool isFav =
        UserDM.currentUser!.favoriteEventsIds.contains(widget.event.id);
    return InkWell(
      onTap: () {
        isFav
            ? removeEventFromFavorite(widget.event.id)
            : addEventToFavorite(widget.event.id);
        setState(() {});
        widget.onFavClick?.call();
      },
      child: Icon(
        isFav ? Icons.favorite : Icons.favorite_border,
        color: AppColors.blue,
      ),
    );
  }
}
