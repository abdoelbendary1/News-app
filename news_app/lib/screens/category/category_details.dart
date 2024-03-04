import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/appThem.dart';
import 'package:news_app/screens/category/categoryTab.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({super.key});
  static const String routeName = "categoryScreen";

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      appBar: AppBar(
        title: const Text("News App"),
      ),
      body: FutureBuilder(
        future: ApiManager.getSourceData(),
        builder: (context, snapshot) {
          var sourcesList = snapshot.data?.sources ?? [];
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
                      ApiManager.getSourceData();
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
                      ApiManager.getSourceData();
                      setState(() {});
                    },
                    child: const Text("try again")),
              ],
            );
          }
          return TabWidget(
            sourcesList: sourcesList,
          );
        },
      ),
    );
  }
}
