import 'package:evently_c15/l10n/app_localizations.dart';
import 'package:evently_c15/ui/model/category_dm.dart';
import 'package:evently_c15/ui/utils/app_assets.dart';
import 'package:evently_c15/ui/utils/app_colors.dart';
import 'package:evently_c15/ui/widgets/categories_tabs.dart';
import 'package:evently_c15/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  CategoryDM selectedCategory = CategoryDM.addEventCategories[0];
  DateTime selectedDate = DateTime.now();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Event')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 16,
            children: [
              buildCategoryImage(),
              buildCategoriesTabs(),
              buildTitleTextField(),
              buildDescriptionTextField(),
              buildDateRow(),
              buildTimeRow(),
              buildLocationTextField(),
              buildCreateButton(),
            ],
          ),
        ),
      ),
    );
  }

  buildCategoryImage() => ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
          color: Colors.black,
          child: Image.asset(
            AppAssets.appHorizontalLogo,
            height: MediaQuery.of(context).size.height * .25,
          )));

  buildCategoriesTabs() => CategoriesTabs(
      categories: CategoryDM.addEventCategories,
      onChanged: (category) {
        selectedCategory = category;
      },
      selectedTextColor: AppColors.white,
      unselectedTextColor: AppColors.blue,
      selectedBgColor: AppColors.blue,
      unselectedBgColor: AppColors.white);

  buildTitleTextField() => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Title",
            style: TextStyle(
                fontSize: 16,
                color: AppColors.black,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 8,
          ),
          CustomTextField(prefixIcon: AppSvg.icTitle, hint: "Event Title"),
        ],
      );

  buildDescriptionTextField() => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Description",
            style: TextStyle(
                fontSize: 16,
                color: AppColors.black,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 8,
          ),
          CustomTextField(
            hint: "Event Description",
            minLines: 5,
          ),
        ],
      );

  buildDateRow() => InkWell(
    onTap: () async{
     selectedDate = (await showDatePicker(context: context,
          firstDate: DateTime.now(),
          initialDate: selectedDate,
          lastDate: DateTime.now().add(Duration(days: 365)),)) ??selectedDate;
    },
    child: Row(
          children: [
            Icon(
              Icons.calendar_month_outlined,
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              "Event Date",
              style: TextStyle(
                  fontSize: 16,
                  color: AppColors.black,
                  fontWeight: FontWeight.w500),
            ),
            Spacer(),
            Text(
              "Choose Date",
              style: TextStyle(
                  fontSize: 16,
                  color: AppColors.blue,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
  );

  buildTimeRow() => Row(
        children: [
          Icon(Icons.access_time),
          SizedBox(
            width: 4,
          ),
          Text("Event Time",
              style: TextStyle(
                fontSize: 16,
                color: AppColors.black,
              )),
          Spacer(),
          Text(
            "Choose Time",
            style: TextStyle(
                fontSize: 16,
                color: AppColors.blue,
                fontWeight: FontWeight.w500),
          )
        ],
      );

  buildLocationTextField() => Container();

  buildCreateButton() => SizedBox(
    width: double.infinity,
    child: ElevatedButton(
        onPressed: () {},
        child: Text(
          "Add Event",
          style: Theme.of(context).textTheme.titleSmall,
        )),
  );
}
