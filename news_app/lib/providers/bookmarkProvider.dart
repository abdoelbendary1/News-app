import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/api/news/article.dart';
import 'package:news_app/api/news/news.dart';
import 'package:news_app/api/source_response/source.dart';

class BookmarkProvider extends ChangeNotifier {
  List<Article> savedNewsList = [];
  String searchText = "";
  List<Article>? searchArticleList = [];
  List<Article> titleSearchList = [];

  void updateSavedList(Article article) {
    savedNewsList.add(article);
    print("added");
    notifyListeners();
  }

  Future<List<Article>?> updateData(Source source) async {
    if (searchText.isEmpty) {
      News news = await ApiManager.getNewsBySourceId(sourceId: source.id ?? "");
      searchArticleList = news.articles;
      return searchArticleList;
    } else {
      return searchArticleList!
          .where((element) =>
              element.title!.toLowerCase().startsWith(searchText.toLowerCase()))
          .toList();
    }
  }

  searchData({required String title, required Source source}) {
    searchText = title;
    updateData(source);
    notifyListeners();
  }
}
