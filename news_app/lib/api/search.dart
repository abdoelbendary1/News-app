// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';

import 'package:news_app/api/news/article.dart';
import 'package:news_app/api/source_response/source.dart';
import 'package:news_app/screens/newsBasedCategory/news_widget.dart';
import 'package:news_app/tabs/homeTab/newsItem.dart';

class SearchNews extends SearchDelegate {
  double height;
  double width;
  List<Article> articleList;
  SearchNews({
    required this.height,
    required this.width,
    required this.articleList,
  });

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.searchNews(searchText: query),
      builder: (context, snapshot) {
        var articles = snapshot.data?.articles ?? [];
        return ListView.builder(
          itemCount: query == "" ? articleList.length : articles.length,
          itemBuilder: (context, index) {
            return NewsItem(
              height: height,
              width: width,
              article: query == "" ? articleList[index] : articles[index],
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text("");
    /*   List<Article> filteredList = articleList
        .where((element) =>
            element.title!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return FutureBuilder(
      future: ApiManager.searchNews(searchText: query),
      builder: (context, snapshot) {
        /* var articles = snapshot.data?.articles ?? []; */
        return ListView.builder(
          itemCount: query == "" ? articleList.length : filteredList.length,
          itemBuilder: (context, index) {
            return NewsItem(
              height: height,
              width: width,
              article: query == "" ? articleList[index] : filteredList[index],
            );
          },
        );
      },
    ); */
  }
}
