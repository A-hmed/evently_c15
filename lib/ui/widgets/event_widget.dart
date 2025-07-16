import 'package:evently_c15/ui/model/event_dm.dart';
import 'package:evently_c15/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class EventWidget extends StatelessWidget {
  final EventDM event;

  const EventWidget({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .25,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(image: AssetImage(event.image)),
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
        child: Text(
          event.date,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.blue),
        ),
      );

  buildEventInfo() => Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            Expanded(child: Text(event.title)),
            Icon(
              event.isFav ? Icons.favorite : Icons.favorite_border,
              color: AppColors.blue,
            ),
          ],
        ),
      );
}
