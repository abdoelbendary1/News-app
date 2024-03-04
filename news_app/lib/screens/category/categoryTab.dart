import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/api/source_response/source.dart';
import 'package:news_app/appThem.dart';
import 'package:news_app/screens/category/news_widget.dart';
import 'package:news_app/screens/category/tabItem.dart';

class TabWidget extends StatefulWidget {
  TabWidget({super.key, required this.sourcesList});
  List<Source> sourcesList = [];

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourcesList.length,
      child: Column(
        children: [
          TabBar(
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
          )
        ],
      ),
    );
  }
}
