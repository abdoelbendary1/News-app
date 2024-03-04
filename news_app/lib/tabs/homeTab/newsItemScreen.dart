import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/api/news/article.dart';
import 'package:news_app/appThem.dart';
import 'package:news_app/screens/category/tabItem.dart';
import 'package:news_app/tabs/homeTab/panelWidget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class NewsItemScreen extends StatelessWidget {
  NewsItemScreen({
    super.key,
    this.article,
  });
  static const String routeName = "newsItemScreen";
  Article? article;
  String iconPath = "assets/images/icons/";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Article;

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double minPanelClosed = screenHeight * 0.4;
    double maxPanelClosed = screenHeight * 0.7;
    /* bool isOpen = false; */
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 30,
          ),
        ),
        actions: [
          Transform.scale(
            scale: 1.3,
            child: IconButton(
                onPressed: () {},
                icon: ImageIcon(
                  AssetImage(
                    "${iconPath}share.png",
                  ),
                )),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.bookmark_outline_outlined,
              size: 35,
            ),
          ),
        ],
      ),
      body: SlidingUpPanel(
        /*   onPanelOpened: () => isOpen = true,
        onPanelClosed: () => isOpen = false, */
        parallaxEnabled: true,
        parallaxOffset: 0.5,
        isDraggable: true,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        maxHeight: maxPanelClosed,
        minHeight: minPanelClosed,
        body: BodyWidget(
          args: args,
          screenHeight: screenHeight,
          /*    isOpen: isOpen, */
        ),
        panelBuilder: (controller) {
          return PanelWidget(
            controller: controller,
            article: args,
          );
        },
      ),
    );
  }
}

class BodyWidget extends StatelessWidget {
  BodyWidget({
    super.key,
    required this.args,
    required this.screenHeight,
    /*  required this.isOpen, */
  });

  final Article args;
  final double screenHeight;
  /*  bool isOpen; */

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: screenHeight,
        width: MediaQuery.of(context).size.width,
        child: LayoutBuilder(
          builder: (context, constraints) {
            var localHeight = constraints.maxHeight;
            var localWidth = constraints.maxWidth;
            return Stack(
              children: [
                SizedBox(
                  child: Image.network(
                    opacity: AlwaysStoppedAnimation(0.5),
                    args.urlToImage ?? "",
                    height: screenHeight * 0.6,
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: localHeight * 0.42,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TabItem(source: args.source!, isSelected: true),
                        SizedBox(
                          height: localHeight * 0.1,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: RichText(
                            text: TextSpan(
                              text: args.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: AppTheme.whiteColor),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ));
  }
}
