/* import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/api/category/categoryDM.dart';
import 'package:news_app/appThem.dart';
import 'package:news_app/screens/category/categoryTab.dart';

// ignore: must_be_immutable
class CategoryDetails extends StatefulWidget {
  CategoryDetails({
    super.key,
  });
  static const String routeName = "categoryScreen";
  late CategoryDM category;

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
          return TabWidget(
            sourcesList: sourcesList,
          );
        },
      ),
    );
  }
}
 */