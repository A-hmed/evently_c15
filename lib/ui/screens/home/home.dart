import 'package:evently_c15/ui/screens/home/tabs/favorite_tab/favorite_tab.dart';
import 'package:evently_c15/ui/screens/home/tabs/home_tab/home_tab.dart';
import 'package:evently_c15/ui/screens/home/tabs/map_tab/map_tab.dart';
import 'package:evently_c15/ui/screens/home/tabs/profile_tab/profile_tab.dart';
import 'package:evently_c15/ui/utils/app_assets.dart';
import 'package:evently_c15/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var currentIndex = 0;
  List<Widget> tabs = [HomeTab(), MapTab(), FavoriteTab(), ProfileTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],
      floatingActionButton: buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: AppColors.blue,
      shape: StadiumBorder(side: BorderSide(color: Colors.white, width: 3)),
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }

  buildBottomNavigationBar() => Theme(
        data: Theme.of(context).copyWith(canvasColor: AppColors.blue),
        child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              currentIndex = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(currentIndex == 0
                      ? AppAssets.homeActive
                      : AppAssets.home)),
                  label: "home"),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(
                      currentIndex == 1 ? AppAssets.mapActive : AppAssets.map)),
                  label: "map"),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(currentIndex == 2
                      ? AppAssets.loveActive
                      : AppAssets.love)),
                  label: "Love"),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(currentIndex == 3
                      ? AppAssets.profileActive
                      : AppAssets.profile)),
                  label: "profile")
            ]),
      );
}
