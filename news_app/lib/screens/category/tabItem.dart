import 'package:flutter/material.dart';
import 'package:news_app/api/source_response/source.dart';
import 'package:news_app/appThem.dart';

class TabItem extends StatelessWidget {
  TabItem({super.key, required this.source, required this.isSelected});
  Source source;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: isSelected ? AppTheme.darkGreen : Colors.transparent,
          border: Border.all(
            color: AppTheme.darkGreen,
            width: 2,
          )),
      margin: EdgeInsets.only(top: 20),
      child: Text(
        source.name ?? "",
        style: TextStyle(
            color: isSelected ? AppTheme.whiteColor : AppTheme.darkGreen,
            fontSize: 15),
      ),
    );
  }
}
