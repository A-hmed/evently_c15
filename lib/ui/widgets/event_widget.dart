import 'package:evently_c15/model/event_dm.dart';
import 'package:evently_c15/ui/utils/app_assets.dart';
import 'package:evently_c15/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class EventWidget extends StatelessWidget {
  final EventDM eventDM;

  const EventWidget({super.key, required this.eventDM});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
        color: Colors.black,
          image: DecorationImage(
              image: AssetImage(eventDM.image))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildDate(),
          Spacer(),
          buildTitle(),
        ],
      ),
    );
  }

  buildDate() => Container(
    padding: EdgeInsets.all(8),
    margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: AppColors.gray, borderRadius: BorderRadius.circular(8)),
        child: Text(
          eventDM.date,
          style: TextStyle(
              color: AppColors.blue, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );

  buildTitle() => Container(
    margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            Text(eventDM.title,
                style: TextStyle(
                    color: AppColors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            Spacer(),
            ImageIcon(AssetImage(eventDM.isFavorite
                ? AppAssets.loveActive
                : AppAssets.icFavorite)),
          ],
        ),
      );
}
