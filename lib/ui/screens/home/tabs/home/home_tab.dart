import 'package:evently_c15/model/category_dm.dart';
import 'package:evently_c15/model/event_dm.dart';
import 'package:evently_c15/ui/utils/app_assets.dart';
import 'package:evently_c15/ui/utils/app_colors.dart';
import 'package:evently_c15/ui/widgets/category_tabs.dart';
import 'package:evently_c15/ui/widgets/event_widget.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [buildHeader(), Expanded(child: buildEventsList())],
    );
  }

  buildHeader() => Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: AppColors.blue,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            )),
        child: Column(
          children: [
            buildUserInfo(),
            SizedBox(
              height: 8,
            ),
            buildCategoriesTabs(),
          ],
        ),
      );

  buildUserInfo() => Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome Back ✨",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              Text(
                "John Safwat",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                  Text(
                    "Cairo, Egypt",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  )
                ],
              )
            ],
          ),
          Spacer(),
          Icon(Icons.language, color: Colors.white),
          Icon(Icons.light_mode, color: Colors.white),
        ],
      );

  buildCategoriesTabs() => CategoryTabs(
        categories: CategoryDM.homeCategories,
        onTabSelected: (category) {
          print(category.title);
        },
        selectedTabBg: AppColors.white,
        selectedTabTextColor: AppColors.blue,
        unselectedTabBg: AppColors.blue,
        unselectedTabTextColor: AppColors.white,
      );

  buildEventsList() => ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) => EventWidget(
          eventDM: EventDM(
              title: "This is a Birthday Party ",
              image: AppAssets.appHorizontalLogo,
              date: "21 \n Nov",
              isFavorite: false,
              description: "description",
              time: "time",
              lat: 0,
              lng: 0)));
}
