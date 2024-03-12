import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constant.dart';
import 'package:news_app/api/news/news.dart';
import 'package:news_app/api/source_response/source_response.dart';

class ApiManager {
  static Future<SourceResponse> getSourceData(String categoryID) async {
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.sourcePath, {
      "apiKey": ApiConstant.apiKey,
      "category": categoryID,
    });
    try {
      var response = await http.get(url);
      String responseBody = response.body;
      var json = jsonDecode(responseBody);
      return SourceResponse.fromJson(json);
    } catch (e) {
      print(e);
      throw e;
    }
  }

  static Future<News> getNewsBySourceId({
    String? sourceId = "",
    String? page,
    String? pageSize,
  }) async {
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.newsPath, {
      "sources": sourceId,
      "apiKey": ApiConstant.apiKey,
      "pageSize": pageSize,
      "page": page,
    });
    try {
      var response = await http.get(url);
      String responseBody = response.body;
      var json = jsonDecode(responseBody);
      return News.fromJson(json);
    } catch (e) {
      print(e);
      throw e;
    }
  }

/* https://newsapi.org/v2/everything?q=apple&from=2024-03-09&to=2024-03-09&sortBy=popularity&apiKey=13b909f3289046b0b94e3423c0cbdeca */
  static Future<News> searchNews({
    String? searchText,
    String? sortBy,
    String? page,
  }) async {
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.newsPath, {
      "apiKey": ApiConstant.apiKey,
      "q": searchText,
      "sortBy": sortBy,
    });
    try {
      var response = await http.get(url);
      String responseBody = response.body;
      var json = jsonDecode(responseBody);
      return News.fromJson(json);
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
