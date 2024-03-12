import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:news_app/FireBaseUtils/FireBaseUtils.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/api/news/article.dart';
import 'package:news_app/api/news/news.dart';
import 'package:news_app/api/source_response/source.dart';
import 'package:news_app/model/user.dart';

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

  Future<List<Article>?> updateData(SourceApi source) async {
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

  searchData({required String title, required SourceApi source}) {
    searchText = title;
    updateData(source);
    notifyListeners();
  }

  Future<void> updateBookmarkArticle(
      Article currentArticle, String userId) async {
    return await FireBaseUtils.getUsersCollection()
        .doc(userId)
        .collection(Article.collectionName)
        .doc(currentArticle.id)
        .update({
          'isBookmarked': true,
        })
        .then((value) => print("article Updated"))
        .catchError((error) => print("Failed to update article: $error"));
  }

  notifyListeners();
}
