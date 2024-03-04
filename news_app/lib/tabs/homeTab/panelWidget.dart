import 'package:flutter/material.dart';
import 'package:news_app/api/news/article.dart';
import 'package:news_app/appThem.dart';

class PanelWidget extends StatelessWidget {
  PanelWidget({
    super.key,
    required this.controller,
    required this.article,
  });
  ScrollController controller;
  Article article;
  RegExp pattern = RegExp(r"\[\+(\d+)\s+chars\]");
  String replacment = " Click here for more";

  @override
  Widget build(BuildContext context) {
    List<String>? authorList = article.author?.split("Associated");
    List<String>? contentList =
        article.content?.replaceFirst(pattern, replacment).split(replacment);
    print(contentList);
    return ListView(
      padding: EdgeInsets.zero,
      controller: controller,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  alignment: Alignment.center,
                  height: 5,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: AppTheme.greyLight),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 36, horizontal: 10),
                child: buildContent(context, contentList, authorList),
              )
            ],
          ),
        )
      ],
    );
  }

  Column buildContent(BuildContext context, List<String>? contentList,
      List<String>? authorList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              maxRadius: 30,
              backgroundColor: Colors.black,
            ),
            SizedBox(
              width: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(
                authorList?[0] ?? "",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(letterSpacing: 5),
              ),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Description",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 30,
                color: AppTheme.blackDarker,
                fontWeight: FontWeight.bold,
                letterSpacing: 3.0,
              ),
        ),
        SizedBox(
          height: 20,
        ),
        Text.rich(
          textAlign: TextAlign.left,
          TextSpan(
            text: article.description,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: AppTheme.greyDarker),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Content",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 25,
                color: AppTheme.purpleLight,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
        ),
        SizedBox(
          height: 20,
        ),
        Text.rich(
          TextSpan(
            text: contentList?[0] ?? "",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: AppTheme.greyDarker),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              backgroundColor: AppTheme.purpleDarker,
              foregroundColor: AppTheme.whiteColor,
              minimumSize: Size(double.infinity, 50),
            ),
            onPressed: () {},
            child: Text(
              "More info",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}
