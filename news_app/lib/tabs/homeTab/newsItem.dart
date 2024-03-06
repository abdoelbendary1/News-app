import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/api/news/article.dart';
import 'package:news_app/appThem.dart';
import 'package:news_app/providers/bookmarkProvider.dart';
import 'package:news_app/tabs/homeTab/newsItemScreen.dart';
import 'package:provider/provider.dart';

class NewsItem extends StatelessWidget {
  NewsItem({
    super.key,
    required this.height,
    required this.width,
    required this.article,
  });
  double width, height;
  Article article;
  String iconPath = "assets/images/icons/";

  @override
  Widget build(BuildContext context) {
    var bookmarkProvider = Provider.of<BookmarkProvider>(context);
    return GestureDetector(
      //go to news page
      onTap: () => Navigator.pushNamed(context, NewsItemScreen.routeName,
          arguments: this.article),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: const BorderSide(width: 0.5, color: AppTheme.greyLight)),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: AppTheme.whiteColor,
              borderRadius: BorderRadius.circular(25)),
          child: Column(children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
              child: CachedNetworkImage(
                width: width,
                height: height * 0.6,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
                imageUrl: article.urlToImage ?? "",
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              /*   Image.network(
                article.urlToImage ?? "",
                width: width,
                height: height * 0.6,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ), */
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 15, top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: width * 0.65,
                    child: RichText(
                      text: TextSpan(
                          text: article.title ?? "",
                          style: Theme.of(context).textTheme.titleSmall),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        bookmarkProvider.updateSavedList(article);
                      },
                      icon: Icon(
                        Icons.bookmark_border,
                        size: 40,
                      ))
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
