import 'package:evently_c15/ui/model/category_dm.dart';
import 'package:evently_c15/ui/model/event_dm.dart';
import 'package:evently_c15/ui/utils/app_assets.dart';
import 'package:evently_c15/ui/utils/app_colors.dart';
import 'package:evently_c15/ui/widgets/categories_tabs.dart';
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

  buildEventsList() => ListView.builder(
      itemCount: 20,
      itemBuilder: (_, index) {
        return EventWidget(
          event: EventDM(
              title: "This is a Birthday Party ",
              date: "21\nNov",
              image: AppAssets.appHorizontalLogo,
              isFav: false,
              description: "description",
              category: ""),
        );
      });

  buildHeader() => Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: AppColors.blue,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(16),
                bottomLeft: Radius.circular(16))),
        child: Column(
          children: [
            buildUserInfo(),
            SizedBox(
              height: 12,
            ),
            buildCategoriesTabs()
          ],
        ),
      );

  buildUserInfo() => Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome Back ✨",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              Text(
                "John Safwat",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                  Text(
                    "Cairo, Egypt",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              )
            ],
          )),
          Icon(
            Icons.language,
            color: Colors.white,
          ),
          Icon(
            Icons.light_mode,
            color: Colors.white,
          ),
        ],
      );

  buildCategoriesTabs() => Container(
        child: CategoriesTabs(
            categories: CategoryDM.homeCategories,
            onChanged: (category) {
              print(category.name);
            },
            selectedTextColor: AppColors.blue,
            unselectedTextColor: AppColors.white,
            selectedBgColor: AppColors.white,
            unselectedBgColor: AppColors.blue),
      );
}
