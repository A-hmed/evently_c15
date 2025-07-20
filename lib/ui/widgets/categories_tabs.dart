import 'package:evently_c15/ui/model/category_dm.dart';
import 'package:flutter/material.dart';

class CategoriesTabs extends StatefulWidget {
  final List<CategoryDM> categories;
  final Color selectedTextColor;
  final Color unselectedTextColor;
  final Color selectedBgColor;
  final Color unselectedBgColor;
  final Function(CategoryDM) onChanged;

  const CategoriesTabs(
      {super.key,
      required this.categories,
      required this.selectedTextColor,
      required this.unselectedTextColor,
      required this.selectedBgColor,
      required this.unselectedBgColor,
      required this.onChanged});

  @override
  State<CategoriesTabs> createState() => _CategoriesTabsState();
}

class _CategoriesTabsState extends State<CategoriesTabs> {
  late CategoryDM selectedCategory;

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.categories[0];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.categories.length,
      child: TabBar(
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          indicatorColor: Colors.transparent,
          dividerColor: Colors.transparent,
          onTap: (index){
            selectedCategory = widget.categories[index];
            widget.onChanged(selectedCategory);
            setState(() {});
          },
          tabs: widget.categories
              .map((category) => mapCategoryToTab(category, category == selectedCategory))
              .toList()),
    );
  }

  Widget mapCategoryToTab(CategoryDM category, bool isSelected) => Tab(
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: isSelected ? widget.selectedBgColor : widget.unselectedBgColor,
              borderRadius: BorderRadius.circular(46),
              border: Border.all(color: widget.selectedBgColor, width: 2)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                category.iconData,
                color: isSelected ? widget.selectedTextColor : widget.unselectedTextColor,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                category.name,
                style: TextStyle(
                    color: isSelected ? widget.selectedTextColor : widget.unselectedTextColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
            ],
          ),
        ),
      );
}
