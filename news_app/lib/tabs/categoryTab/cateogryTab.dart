import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/api/category/categoryDM.dart';
import 'package:news_app/appThem.dart';
import 'package:news_app/tabs/categoryTab/categoryItem.dart';

class CategoryTab extends StatelessWidget {
  CategoryTab({super.key, required this.onCategoryClick});
  List<CategoryDM> categoryList = CategoryDM.getCategories();
  Function(CategoryDM) onCategoryClick;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      height: screenHeight,
      decoration: const BoxDecoration(color: AppTheme.whiteColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: screenHeight * 0.07,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Categories",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
            child: Text(
              "Thousands of articles in each category",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: AppTheme.greyDarker),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 2,
                  childAspectRatio: 4.5),
              itemCount: categoryList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
                  child: GestureDetector(
                    onTap: () {
                      onCategoryClick(categoryList[index]);
                    },
                    child: CategoryItem(
                      category: categoryList[index],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
