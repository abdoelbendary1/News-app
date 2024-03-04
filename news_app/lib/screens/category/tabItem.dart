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
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: isSelected ? AppTheme.purplePrimary : AppTheme.greyLighter,
      ),
      margin: EdgeInsets.only(top: 20),
      child: Text(
        source.name ?? "",
        style: TextStyle(
            color: isSelected ? AppTheme.whiteColor : AppTheme.greyPrimary,
            fontSize: 15),
      ),
    );
  }
}
