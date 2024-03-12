import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/api/news/article.dart';
import 'package:news_app/api/news/news.dart';
import 'package:news_app/api/source_response/source.dart';
import 'package:news_app/appThem.dart';
import 'package:news_app/tabs/homeTab/newsItem.dart';

class NewsWidget extends StatefulWidget {
  NewsWidget({
    super.key,
    required this.source,
  });
  SourceApi source;

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  /* List<Article> newsList = [];
  int pageSize = 10;
  int page = 1;
  ScrollController scrollController = ScrollController();
  bool isloadMore = false;

  fetchData() async {
    News news = await ApiManager.getNewsBySourceId(
      sourceId: widget.source.id,
      page: page.toString(),
      pageSize: pageSize.toString(),
    );
    setState(() {
      List<Article> articles = news.articles!.toList();
      newsList.addAll(articles);
    });
  }

  @override
  void initState() {
    fetchData();

    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        setState(() {
          isloadMore = true;
        });
        page += 1;
        await fetchData();
        setState(() {
          isloadMore = false;
        });
      }
    });
    super.initState();
  } */

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    /*  return Expanded(
      child: ListView.builder(
        controller: scrollController,
        itemCount: isloadMore ? newsList.length + 1 : newsList.length,
        itemBuilder: (context, index) {
          if (index >= newsList.length) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: NewsItem(
                height: screenHeight * 0.3,
                width: screenWidth,
                article: newsList[index],
              ),
              /* child: Text(newsList[index].author ?? ""), */
            );
          }
        },
      ),
    ); */
    return FutureBuilder(
      future: ApiManager.getNewsBySourceId(
        sourceId: widget.source.id,
        page: "2",
        pageSize: "5",
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppTheme.darkGreen,
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Column(
              children: [
                const Text("something went wrong"),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getNewsBySourceId(
                        sourceId: widget.source.id,
                        page: "2",
                        pageSize: "5",
                      );
                      setState(() {});
                    },
                    child: const Text("try again")),
              ],
            ),
          );
        }
        if (snapshot.data?.status != "ok") {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("something went wrong"),
              ElevatedButton(
                  onPressed: () {
                    ApiManager.getNewsBySourceId(
                      sourceId: widget.source.id,
                      page: "2",
                      pageSize: "5",
                    );
                    setState(() {});
                  },
                  child: const Text("try again")),
            ],
          );
        }
        var newsList = snapshot.data?.articles ?? [];

        return Expanded(
          child: ListView.builder(
            /*  controller: scrollController, */
            itemCount: newsList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: NewsItem(
                  height: screenHeight * 0.3,
                  width: screenWidth,
                  article: newsList[index],
                ),
                /* child: Text(newsList[index].author ?? ""), */
              );
            },
          ),
        );
      },
    );
  }
}
