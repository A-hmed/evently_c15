import 'package:evently_c15/model/category_dm.dart';
import 'package:evently_c15/ui/utils/app_assets.dart';
import 'package:evently_c15/ui/utils/app_colors.dart';
import 'package:evently_c15/ui/widgets/category_tabs.dart';
import 'package:evently_c15/ui/widgets/custom_button.dart';
import 'package:evently_c15/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16,
          children: [
            buildCategoryImage(),
            buildCategoryTabs(),

            buildTitleTextField(),
            buildDescriptionTextField(),
            buildEventDate(),
            buildEventTime(),
            buildEventLocation(),
            Spacer(),
            buildAddEventButton()
          ],
        ),
      ),
    );
  }

  buildAppBar() => AppBar(
        title: Text("Create Event"),
      );

  buildCategoryImage() => ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          AppAssets.appHorizontalLogo,
          height: MediaQuery.of(context).size.height * 0.25,
        ),
      );

  buildCategoryTabs() => CategoryTabs(
      categories: CategoryDM.createEventsCategories,
      onTabSelected: (category) {
        print(category.title);
      },
      selectedTabBg: AppColors.blue,
      selectedTabTextColor: AppColors.white,
      unselectedTabBg: AppColors.white,
      unselectedTabTextColor: AppColors.blue,
    );


  buildTitleTextField() => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Text("Event title", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.black),),
      SizedBox(height: 8,),
      CustomTextField(
        hint: "Event Title",
        prefixIcon: AppSvg.icTitle,
      ),
    ],
  );

  buildDescriptionTextField() => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Text("Description", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.black),),
      SizedBox(height: 8,),
      CustomTextField(
        hint: "Description",
        minLines: 5,
      ),
    ],
  );

  buildEventDate() => Row(
    children: [
      Icon(Icons.calendar_month),
      Text("Event Date", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.black),),
      Spacer(),
      Text("Choose date", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.blue),),
    ],
  );

  buildEventTime() => Row(
    children: [
      Icon(Icons.access_time),
      Text("Event Time", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.black),),
      Spacer(),
      Text("Choose time", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.blue),),
    ],
  );

  buildEventLocation() => Container();

  buildAddEventButton() => CustomButton(text: "Add event", onClick: (){

  });
}
