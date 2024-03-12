import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/FireBaseUtils/FireBaseUtils.dart';
import 'package:news_app/api/news/article.dart';
import 'package:news_app/appThem.dart';
import 'package:news_app/providers/authProvider.dart';
import 'package:news_app/providers/bookmarkProvider.dart';
import 'package:news_app/tabs/homeTab/newsItemScreen.dart';
import 'package:provider/provider.dart';

class NewsItem extends StatefulWidget {
  NewsItem({
    super.key,
    required this.height,
    required this.width,
    required this.article,
  });
  double width, height;
  Article article;

  @override
  State<NewsItem> createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  String iconPath = "assets/images/icons/";
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    var bookmarkProvider = Provider.of<BookmarkProvider>(context);
    var authProvider = Provider.of<AuthProviders>(context);
    return GestureDetector(
      //go to news page
      onTap: () => Navigator.pushNamed(context, NewsItemScreen.routeName,
          arguments: this.widget.article),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: const BorderSide(width: 0.5, color: AppTheme.greyLight)),
        child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
              color: AppTheme.whiteColor,
              borderRadius: BorderRadius.circular(25)),
          child: Column(children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
              child: CachedNetworkImage(
                width: widget.width,
                height: widget.height * 0.6,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
                imageUrl: widget.article.urlToImage ?? "",
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
                    width: widget.width * 0.65,
                    child: RichText(
                      text: TextSpan(
                          text: widget.article.title ?? "",
                          style: Theme.of(context).textTheme.titleSmall),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        bookmarkProvider.updateSavedList(widget.article);
                        FireBaseUtils.addBookmarkedArticleToFireStore(
                            authProvider.currrentUser?.id ?? "",
                            widget.article);
                        bookmarkProvider.updateBookmarkArticle(widget.article,
                            authProvider.currrentUser?.id ?? "");
                        if (widget.article.isBookmarked == true) {
                          setState(() {
                            isBookmarked = widget.article.isBookmarked ?? true;
                          });
                        } else {
                          isBookmarked = widget.article.isBookmarked ?? false;
                        }
                        print("isBookmarked:$isBookmarked");
                        print("api saved : ${widget.article.isBookmarked}");
                      },
                      icon: Icon(
                        isBookmarked ? Icons.bookmark : Icons.bookmark_border,
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
