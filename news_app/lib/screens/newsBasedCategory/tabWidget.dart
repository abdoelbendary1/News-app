import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/api/source_response/source.dart';
import 'package:news_app/appThem.dart';
import 'package:news_app/screens/newsBasedCategory/news_widget.dart';
import 'package:news_app/screens/newsBasedCategory/tabItem.dart';
import 'package:news_app/tabs/homeTab/customTextFormField.dart';

class TabWidget extends StatefulWidget {
  TabWidget({super.key, required this.sourcesList, required this.searchText});
  List<Source> sourcesList = [];
  String searchText;

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  int selectedIndex = 0;
  String iconPath = "assets/images/icons/";

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: widget.sourcesList.length,
      child: Column(
        children: [
          TabBar(
              padding: EdgeInsets.zero,
              tabAlignment: TabAlignment.start,
              dividerHeight: 0,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              indicatorColor: Colors.transparent,
              isScrollable: true,
              tabs: widget.sourcesList
                  .map((source) => TabItem(
                      source: source,
                      isSelected:
                          selectedIndex == widget.sourcesList.indexOf(source)))
                  .toList()),
          Expanded(
            child: NewsWidget(
              source: widget.sourcesList[selectedIndex],
            ),
          ),
        ],
      ),
    );
  }
}
