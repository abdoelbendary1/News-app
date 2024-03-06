import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/api/category/categoryDM.dart';
import 'package:news_app/appThem.dart';
import 'package:news_app/screens/category/category_details.dart';
import 'package:news_app/tabs/categoryTab/cateogryTab.dart';
import 'package:news_app/tabs/homeTab/homeTab.dart';
import 'package:news_app/tabs/saved/savedTab.dart';
import 'package:news_app/tabs/user/userTab.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  static const String routeName = "homeScreen";

  CategoryDM? selectedCategory;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Widget> tabs;
  int selectedIndex = 1;

  String iconPath = "assets/images/icons/";
  @override
  void initState() {
    super.initState();
    CategoryDM generalCategory = CategoryDM(
        id: "general",
        name: "General",
        imagePath: "assets/images/categories/general.png");
    if (widget.selectedCategory == null) {
      widget.selectedCategory = generalCategory;
    } else {
      widget.selectedCategory = widget.selectedCategory;
    }
    tabs = [
      HomeTab(
        category: widget.selectedCategory!,
      ),
      CategoryTab(
        onCategoryClick: openNewsByCategory,
      ),
      SavedTab(),
      UserTab(),
    ];
  }

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

//TODO Update category
  void openNewsByCategory(CategoryDM newSelectedCategory) async {
    widget.selectedCategory = newSelectedCategory;
    tabs[0] = HomeTab(category: widget.selectedCategory!);
    selectedIndex = 0;
    /*  await ApiManager.getSourceData(widget.selectedCategory!.id); */
    setState(() {});
    print(widget.selectedCategory!.id);
  }
}
