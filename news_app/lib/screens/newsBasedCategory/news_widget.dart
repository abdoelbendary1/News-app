import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/api/news/news.dart';
import 'package:news_app/api/source_response/source.dart';
import 'package:news_app/appThem.dart';
import 'package:news_app/tabs/homeTab/newsItem.dart';

class NewsWidget extends StatefulWidget {
  NewsWidget({
    super.key,
    required this.source,
  });
  Source source;

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: ApiManager.getNewsBySourceId(
        sourceId: widget.source.id,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
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
                    ApiManager.getNewsBySourceId(
                        sourceId: widget.source.id ?? "");
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
                    ApiManager.getNewsBySourceId(
                        sourceId: widget.source.id ?? "");
                    setState(() {});
                  },
                  child: const Text("try again")),
            ],
          );
        }
        var newsList = snapshot.data?.articles ?? [];

        return SingleChildScrollView(
          child: SizedBox(
            height: screenHeight * 0.5,
            child: Column(
              children: [
                Expanded(
                  flex: 9,
                  child: ListView.builder(
                    itemCount: newsList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            return NewsItem(
                              height: screenHeight * 0.3,
                              width: screenWidth,
                              article: newsList[index],
                            );
                          },
                        ),
                        /* child: Text(newsList[index].author ?? ""), */
                      );
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => ElevatedButton(
                        onPressed: () {
                          /*    ApiManager.getNewsBySourceId(
                            sourceId: widget.source.id,
                            page: (index + 1).toString(),
                          );
                          setState(() {}); */
                        },
                        child: Text("${index + 1}")),
                    separatorBuilder: (context, index) => const VerticalDivider(
                      color: Colors.transparent,
                      thickness: 5,
                    ),
                    itemCount: 20,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
