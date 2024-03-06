import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/api/news/article.dart';
import 'package:news_app/api/source_response/source.dart';
import 'package:news_app/appThem.dart';
import 'package:news_app/providers/bookmarkProvider.dart';
import 'package:news_app/screens/category/news_widget.dart';
import 'package:news_app/tabs/homeTab/newsItem.dart';
import 'package:provider/provider.dart';

class SavedTab extends StatelessWidget {
  SavedTab({super.key});
  List<Article> savedNewsList = [];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    var bookmarkProvider = Provider.of<BookmarkProvider>(context);
    savedNewsList = bookmarkProvider.savedNewsList;
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.whiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: screenHeight * 0.07,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Bookmarks",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
            child: Text(
              "Saved articles to the library",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: AppTheme.greyDarker),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: savedNewsList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: NewsItem(
                      height: screenHeight * 0.3,
                      width: screenWidth,
                      article: savedNewsList[index]),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
