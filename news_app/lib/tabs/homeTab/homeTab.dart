import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/api/category/categoryDM.dart';
import 'package:news_app/appThem.dart';
import 'package:news_app/screens/category/categoryTab.dart';
import 'package:news_app/tabs/homeTab/customTextFormField.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key, required this.category});
  CategoryDM category;
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String iconPath = "assets/images/icons/";
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenHeight,
      width: screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.grey,
                  ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.01,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              child: CustomTextFormField(
                controller: searchController,
                hintText: "Search",
                suffixIcon: ImageIcon(
                  AssetImage("${iconPath}mic.png"),
                ),
                prefixicon: ImageIcon(
                  AssetImage("${iconPath}search.png"),
                ),
              ),
            ),
          ),
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
                            ApiManager.getSourceData(widget.category.id);
                            print("error");
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
          ),
        ],
      ),
    );
  }
}
