import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constant.dart';
import 'package:news_app/api/news/news.dart';
import 'package:news_app/api/source_response/source_response.dart';

class ApiManager {
  static Future<SourceResponse> getSourceData() async {
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.sourcePath, {
      "apiKey": ApiConstant.apiKey,
    });
    try {
      var response = await http.get(url);
      String responseBody = response.body;
      var json = jsonDecode(responseBody);
      return SourceResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<News> getNewsBySourceId(String sourceId) async {
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.newsPath, {
      "sources": sourceId,
      "apiKey": ApiConstant.apiKey,
    });
    try {
      var response = await http.get(url);
      String responseBody = response.body;
      var json = jsonDecode(responseBody);
      return News.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
