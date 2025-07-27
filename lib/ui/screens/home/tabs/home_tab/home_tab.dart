import 'package:evently_c15/data/firestore_helper.dart';
import 'package:evently_c15/ui/model/category_dm.dart';
import 'package:evently_c15/ui/model/user_dm.dart';
import 'package:evently_c15/ui/utils/app_colors.dart';
import 'package:evently_c15/ui/widgets/categories_tabs.dart';
import 'package:evently_c15/ui/widgets/event_widget.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  CategoryDM selectedCategory = CategoryDM.homeCategories[0];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [buildHeader(), Expanded(child: buildEventsList())],
    );
  }

  buildEventsList() => FutureBuilder(
      future: getAllEventsFromFirestore(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else if (snapshot.hasData) {
          var events = snapshot.data ?? [];
          if (selectedCategory.name != "All") {
            events = events
                .where((event) => event.category == selectedCategory.name)
                .toList();
          }
          return ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) =>
                  EventWidget(event: events[index]));
        } else {
          return Center(child: CircularProgressIndicator());
        }
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
                UserDM.currentUser!.name,
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

  buildCategoriesTabs() => CategoriesTabs(
      categories: CategoryDM.homeCategories,
      onChanged: (category) {
        selectedCategory = category;
        setState(() {});
      },
      selectedTextColor: AppColors.blue,
      unselectedTextColor: AppColors.white,
      selectedBgColor: AppColors.white,
      unselectedBgColor: AppColors.blue);
}
