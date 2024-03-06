import 'package:flutter/material.dart';
import 'package:news_app/api/category/categoryDM.dart';
import 'package:news_app/appThem.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({super.key, required this.category});
  CategoryDM category;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: AppTheme.greyLight,
            width: 2,
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: screenHeight * 0.08,
            width: screenWidth * 0.08,
            child: Image.asset(category.imagePath),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            category.name,
            style: Theme.of(context).textTheme.titleMedium,
          )
        ],
      ),
    );
  }
}
