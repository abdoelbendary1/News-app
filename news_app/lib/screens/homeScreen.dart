import 'package:flutter/material.dart';
import 'package:news_app/appThem.dart';
import 'package:news_app/screens/category/category_details.dart';
import 'package:news_app/tabs/categoryTab/cateogryTab.dart';
import 'package:news_app/tabs/homeTab/homeTab.dart';
import 'package:news_app/tabs/saved/savedTab.dart';
import 'package:news_app/tabs/user/userTab.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  static const String routeName = "homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [
    HomeTab(),
    CategoryTab(),
    SavedTab(),
    UserTab(),
  ];

  int selectedIndex = 0;

  String iconPath = "assets/images/icons/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("${iconPath}home.png"),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("${iconPath}category.png"),
            ),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("${iconPath}saved.png"),
            ),
            label: "Saved",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("${iconPath}user.png"),
            ),
            label: "User",
          ),
        ],
      ),
      body: tabs[selectedIndex],
    );
  }
}
