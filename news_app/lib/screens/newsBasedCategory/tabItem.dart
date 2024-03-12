import 'package:flutter/material.dart';
import 'package:news_app/api/source_response/source.dart';
import 'package:news_app/appThem.dart';

class TabItem extends StatelessWidget {
  TabItem({super.key, required this.source, required this.isSelected});
  SourceApi source;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
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
