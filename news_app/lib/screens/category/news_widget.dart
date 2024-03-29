import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/api/news/news.dart';
import 'package:news_app/api/source_response/source.dart';
import 'package:news_app/appThem.dart';

class NewsWidget extends StatefulWidget {
  NewsWidget({super.key, required this.source});
  Source source;

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getNewsBySourceId(widget.source.id ?? ""),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: AppTheme.darkGreen,
            ),
          );
        } else if (snapshot.hasError) {
          return Column(
            children: [
              const Text("something went wrong"),
              ElevatedButton(
                  onPressed: () {
                    ApiManager.getNewsBySourceId(widget.source.id ?? "");
                    setState(() {});
                  },
                  child: const Text("try again")),
            ],
          );
        }
        if (snapshot.data?.status != "ok") {
          return Column(
            children: [
              const Text("something went wrong"),
              ElevatedButton(
                  onPressed: () {
                    ApiManager.getNewsBySourceId(widget.source.id ?? "");
                    setState(() {});
                  },
                  child: const Text("try again")),
            ],
          );
        }
        var newsList = snapshot.data?.articles ?? [];
        return ListView.builder(
          itemCount: newsList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(newsList[index].author ?? ""),
            );
          },
        );
      },
    );
  }
}
