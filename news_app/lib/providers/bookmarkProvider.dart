import 'package:flutter/material.dart';
import 'package:news_app/api/news/article.dart';

class BookmarkProvider extends ChangeNotifier {
  List<Article> savedNewsList = [];

  void updateSavedList(Article article) {
    savedNewsList.add(article);
    print("added");
    notifyListeners();
  }
}
