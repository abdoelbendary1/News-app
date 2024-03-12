import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/api/category/categoryDM.dart';
import 'package:news_app/api/news/article.dart';
import 'package:news_app/api/search.dart';
import 'package:news_app/appThem.dart';
import 'package:news_app/providers/bookmarkProvider.dart';
import 'package:news_app/screens/newsBasedCategory/tabWidget.dart';
import 'package:news_app/tabs/homeTab/customTextFormField.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key, required this.category});
  CategoryDM category;

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String iconPath = "assets/images/icons/";
  TextEditingController searchController = TextEditingController();
  String searchText = "";
  late Future search;
  late Future api;

  /*  @override
  void initState() {
    super.initState();
    if (searchText.isNotEmpty) {
      SchedulerBinding.instance.scheduleFrameCallback((DismissUpdateCallback) {
        search = showSearch(context: context, delegate: SearchNews());
      });
    }
  } */

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BookmarkProvider>(context);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenHeight,
      width: screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: FutureBuilder(
              future: ApiManager.getSourceData(widget.category.id),
              builder: (context, snapshot) {
                var sourcesList = snapshot.data?.sources ?? [];
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
                            ApiManager.getSourceData(widget.category.id);

                            setState(() {});
                          },
                          child: const Text("try again")),
                    ],
                  );
                }
                if (snapshot.data?.status != "ok") {
                  return Column(
                    children: [
                      const Text(""),
                      ElevatedButton(
                          onPressed: () {
                            ApiManager.getSourceData(
                              widget.category.id,
                            );
                            print("error");
                            setState(() {});
                          },
                          child: const Text("try again")),
                    ],
                  );
                }
                return Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: screenHeight * 0.07,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "Browse",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "Discover Things of this World",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: Colors.grey,
                                  ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.01,
                      ),
                      Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: FutureBuilder(
                            future: ApiManager.getNewsBySourceId(
                              sourceId: sourcesList[0].id,
                             /*  page: "1",
                              pageSize: "20", */
                            ),
                            builder: (context, snapshot) {
                              return CustomTextFormField(
                                onTap: () {
                                  showSearch(
                                    context: context,
                                    delegate: SearchNews(
                                        height: screenHeight * .4,
                                        width: screenWidth,
                                        articleList:
                                            snapshot.data?.articles ?? []),
                                  );
                                },
                                controller: searchController,
                                hintText: "Search",
                                suffixIcon: ImageIcon(
                                  AssetImage("${iconPath}mic.png"),
                                ),
                                prefixicon: ImageIcon(
                                  AssetImage("${iconPath}search.png"),
                                ),
                              );
                            },
                          )),
                      Expanded(
                        child: TabWidget(
                          sourcesList: sourcesList,
                          searchText: searchController.text,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
